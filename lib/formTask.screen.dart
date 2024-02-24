import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tutorialflutter/data.dart';
import 'package:tutorialflutter/task.model.dart';
import 'package:uuid/uuid.dart';

class FormTaskScreen extends StatefulWidget {
  final TaskModel? task;

  const FormTaskScreen({
    super.key,
    this.task,
  });

  @override
  State<FormTaskScreen> createState() => _FormTaskScreenState();
}

class _FormTaskScreenState extends State<FormTaskScreen> {
  bool isLoading = false;
  bool isEdit = false;
  String title = "Agregar Tarea";

  final tfNameController = TextEditingController();
  final tfDescriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  void dispose() {
    tfNameController.dispose();
    tfDescriptionController.dispose();
    super.dispose();
  }

  init() {
    if (widget.task != null) {
      isEdit = true;
    }
    if (isEdit) {
      title = "Editar Tarea";
      tfNameController.text = widget.task!.name;
      tfDescriptionController.text = widget.task!.description;
    }
  }

  Future saveTask() async {
    TaskModel newTask = TaskModel(id: Uuid().v4(), name: tfNameController.text, description: tfDescriptionController.text);
    tasks.add(newTask);
  }

  Future editTask() async {
    // TaskModel findTask = tasks.firstWhere((element) => element.id == id);
    int index = tasks.indexWhere((element) => element.id == widget.task!.id);
    TaskModel editTask = widget.task!;
    editTask.name = tfNameController.text;
    editTask.description = tfDescriptionController.text;
    tasks[index] = editTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: tfNameController,
                decoration: const InputDecoration(
                  label: Text("Nombre"),
                  hintText: "tarea...",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: tfDescriptionController,
                decoration: const InputDecoration(
                  label: Text("Descripción"),
                  hintText: "descripción...",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return value!.isEmpty ? "Campo requerido" : null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (isEdit) {
                      await editTask();
                    } else {
                      await saveTask();
                    }
                    Fluttertoast.showToast(
                      msg: isEdit ? "Tarea editada" : "Tarea guardada",
                      backgroundColor: Colors.grey.shade300,
                      gravity: ToastGravity.CENTER,
                    );
                    Navigator.pop(context, true);
                  }
                },
                child: const Text("Guardar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

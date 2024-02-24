import 'package:flutter/material.dart';
import 'package:tutorialflutter/data.dart';
import 'package:tutorialflutter/formTask.screen.dart';
import 'package:tutorialflutter/task.model.dart';

class ListTasksScreen extends StatefulWidget {
  const ListTasksScreen({
    super.key,
  });

  @override
  State<ListTasksScreen> createState() => _ListTasksScreenState();
}

class _ListTasksScreenState extends State<ListTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              const Text(
                "Lista de tareas",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    TaskModel task = tasks[index];
                    return ListTile(
                      onTap: () async {
                        final value = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FormTaskScreen(
                              task: task,
                            ),
                          ),
                        );
                        if (value != null) {
                          setState(() {});
                        }
                      },
                      title: Text(task.name),
                      subtitle: Text(task.description),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final value = await Navigator.push(context, MaterialPageRoute(builder: (_) => const FormTaskScreen()));

          if (value != null) {
            setState(() {});
          }
        },
        child: const Icon(
          Icons.add_task,
        ),
      ),
    );
  }
}

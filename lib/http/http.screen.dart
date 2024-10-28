import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorialflutter/http/models/user.model.dart';
import 'package:tutorialflutter/http/services/usersExample.service.dart';

class HttpScreen extends StatefulWidget {
  const HttpScreen({super.key});

  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  late List<UserModel> users;
  bool isLoading = false;

  UserExampleService userExampleService = UserExampleService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findAllUsers();
  }

  Future findAllUsers() async {
    setLoading(true);
    try {
      final result = await userExampleService.findAll();
      if (result != null) {
        users = result;
      }
    } catch (e) {
      print("ocurrio un error al listar usuarios");
    }

    setLoading(false);
  }

  setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final element = users[index];
                return Dismissible(
                  key: Key(element.id),
                  onDismissed: (direction) async {
                    try {
                      await userExampleService.delete(element.id);
                      users.removeWhere((value) => value.id == element.id);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          e.toString(),
                        ),
                      ));
                    }
                  },
                  child: ListTile(
                    title: Text(element.name),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserFormExample(
                              id: element.id,
                            ),
                          ));
                      if (result != null) {
                        findAllUsers();
                      }
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => const UserFormExample()));

          if (result != null) {
            findAllUsers();
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class UserFormExample extends StatefulWidget {
  final String? id;
  const UserFormExample({
    super.key,
    this.id,
  });

  @override
  State<UserFormExample> createState() => _UserFormExampleState();
}

class _UserFormExampleState extends State<UserFormExample> {
  UserExampleService _userExampleService = UserExampleService();

  final tfNameController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      findUser();
    }
  }

  setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  Future<void> findUser() async {
    setLoading(true);
    try {
      final data = await _userExampleService.findById(widget.id!);
      tfNameController.text = data.name;
    } catch (e) {
      log(e.toString());
    }
    setLoading(false);
  }

  Future<void> saveUser() async {
    UserModel newUser = UserModel(id: "0", name: tfNameController.text);
    try {
      _userExampleService.save(newUser);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateUser() async {
    try {
      UserModel updateUser = UserModel(id: widget.id!, name: tfNameController.text);
      _userExampleService.update(updateUser.id, updateUser);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> handleForm() async {
    if (widget.id != null) {
      await updateUser();
    } else {
      await saveUser();
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Crear usuario",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: tfNameController,
                          decoration: InputDecoration(labelText: "Nombre", hintText: "Jose", border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await handleForm();
                            },
                            child: const Text("Guardar"))
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({super.key});

  @override
  State<FormValidationScreen> createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  final formKey = GlobalKey<FormState>();
  final tfUsername = TextEditingController();
  final tfPassword = TextEditingController();

  login() {
    debugPrint(tfUsername.text);
    debugPrint(tfPassword.text);
  }

  bool isValidUsername = true;
  bool isValidPassword = true;
  bool isFormValid = false;

  validateForm() {
    if (tfUsername.text.isEmpty) {
      isValidUsername = false;
    }
    if (tfPassword.text.isEmpty) {
      isValidPassword = false;
    }
    if (isValidPassword & isValidUsername) {
      isFormValid = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: tfUsername,
              decoration: InputDecoration(
                  labelText: "Nombre de usuario", border: OutlineInputBorder(), errorText: isValidUsername ? null : "Campo requerido"),
              onChanged: (value) {
                if (value.isEmpty) {
                  isValidUsername = false;
                } else {
                  isValidUsername = true;
                }
                setState(() {});
              },
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Campo requerido";
              //   }
              //   return null;
              // },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: tfPassword,
              decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                  // errorText: isValidPassword ? null : 'Campo requerido',
                  error: isValidPassword
                      ? null
                      : Text(
                          'Campo requerido',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        )),
              onChanged: (value) {
                if (value.isEmpty) {
                  isValidPassword = false;
                } else {
                  isValidPassword = true;
                }
                setState(() {});
              },
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Campo requerido";
              //   } else if (value.length < 6) {
              //     return "Debe tener mínimo 6 caracteres";
              //   }
              //   return null;
              // },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                validateForm();
                if (isValidUsername && isFormValid) {
                  login();
                  return;
                }
                // if (formKey.currentState!.validate()) {
                //   login();
                //   return;
                // }
                debugPrint("Formulario no valido");
              },
              child: Text("Ingresar"),
            )
          ],
        ),
      ),
    );
  }
}

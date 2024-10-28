import 'package:flutter/material.dart';

class DisposeScreen extends StatefulWidget {
  const DisposeScreen({super.key});

  @override
  State<DisposeScreen> createState() => _DisposeScreenState();
}

class _DisposeScreenState extends State<DisposeScreen> {
  TextEditingController tfController = TextEditingController();

  @override
  void dispose() {
    tfController.dispose();
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => OtherScreen()));
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => OtherScreen()), (route) => false);
            },
            child: const Text("navigate")),
      ),
    );
  }
}

class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

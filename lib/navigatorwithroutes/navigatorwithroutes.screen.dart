import 'package:flutter/material.dart';

class NavigatorWithRoutesScreen extends StatefulWidget {
  const NavigatorWithRoutesScreen({super.key});

  @override
  State<NavigatorWithRoutesScreen> createState() => _NavigatorWithRoutesScreenState();
}

class _NavigatorWithRoutesScreenState extends State<NavigatorWithRoutesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/initial");
            },
            child: const Text("Initial")),
      ),
    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("back")),
      ),
    );
  }
}

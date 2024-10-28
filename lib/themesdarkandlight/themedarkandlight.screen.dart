import 'package:flutter/material.dart';

class ThemeDarkAndLightScreen extends StatefulWidget {
  const ThemeDarkAndLightScreen({super.key});

  @override
  State<ThemeDarkAndLightScreen> createState() => _ThemeDarkAndLightScreenState();
}

class _ThemeDarkAndLightScreenState extends State<ThemeDarkAndLightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Dark and Light Screen"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InitStateScreen extends StatefulWidget {
  const InitStateScreen({super.key});

  @override
  State<InitStateScreen> createState() => _InitStateScreenState();
}

class _InitStateScreenState extends State<InitStateScreen> {
  init() {
    print("initState");
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Ig: yoecode",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

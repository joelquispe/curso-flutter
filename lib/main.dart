import 'package:flutter/material.dart';
import 'package:tutorialflutter/http/http.screen.dart';
import 'package:tutorialflutter/objetos/objetos.screen.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tutorial App',
      debugShowCheckedModeBanner: false,
      home: HttpScreen(),
    );
  }
}



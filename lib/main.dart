import 'package:flutter/material.dart';
import 'package:tutorialflutter/listTasks.screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tutorial app',
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(backgroundColor: Colors.white)
      // ),
      // darkTheme: ThemeData(
      //   appBarTheme: AppBarTheme(backgroundColor: Colors.black)
      // ),
      themeMode: ThemeMode.dark,
      
      home: ListTasksScreen(),
    );
  }
}



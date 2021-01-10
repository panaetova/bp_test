import 'package:app_test/screens/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:app_test/screens/home_page.dart';
import 'package:app_test/screens/landing.dart';
import 'package:app_test/screens/login.dart';
import 'domain/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Task> tasks = List();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I want coffee',
      initialRoute: '/',
      theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: TextTheme(title: TextStyle(color: Colors.white))),
      routes: {
        '/': (context) => TasksList(tasks),
      },
    );
  }
}

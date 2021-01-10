import 'package:app_test/domain/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_test/screens/bottom_menu.dart';

class FindScreen extends StatefulWidget {
  final Function(BuildContext) addNewTask;
  List tasks;

  FindScreen(this.addNewTask, this.tasks);

  @override
  State<StatefulWidget> createState() {
    return FindScreenState(tasks);
  }
}

class FindScreenState extends State<FindScreen> {
  List tasks;
  FindScreenState(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: BottomMenu(widget.addNewTask, tasks),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2c6992),
          splashColor: Color(0xFF4690c1),
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () => widget.addNewTask(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

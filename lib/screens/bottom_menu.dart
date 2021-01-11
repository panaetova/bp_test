import 'package:app_test/screens/find_page.dart';
import 'package:app_test/screens/home_page.dart';
import 'package:app_test/screens/projects_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  final Function(BuildContext) addNewTask;
  List tasks;

  BottomMenu(this.addNewTask, this.tasks);

  @override
  State<StatefulWidget> createState() {
    return BottomMenuState(tasks);
  }
}

class BottomMenuState extends State<BottomMenu> {
  List tasks;
  BottomMenuState(this.tasks);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 2.0,
        shape: CircularNotchedRectangle(),
        color: Color(0xFF55a3d6),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          child: Wrap(
            spacing: 50.0,
            runAlignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TasksList(tasks)));
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Icon(Icons.home, color: Colors.white)),
                    Text(
                      'Home',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProjectList(widget.addNewTask, tasks)));
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Icon(Icons.folder, color: Colors.white)),
                    Text(
                      'Projects',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FindScreen(widget.addNewTask, tasks)));
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Icon(Icons.search, color: Colors.white)),
                    Text(
                      'Search',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print('profile tap');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Icon(Icons.account_circle, color: Colors.white)),
                    Text(
                      'Profile',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

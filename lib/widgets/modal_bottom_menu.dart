import 'package:app_test/domain/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalBottomMenu extends StatefulWidget {
  List tasks;
  ModalBottomMenu(this.tasks);

  @override
  State<StatefulWidget> createState() {
    return _ModalBottomMenuState(tasks);
  }
}

class _ModalBottomMenuState extends State<ModalBottomMenu> {
  List tasks;
  _ModalBottomMenuState(this.tasks);
  String inputTitle;

  Widget _addNewTask(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                color: Color(0xFF737373),
                height: 130,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            style: TextStyle(fontSize: 20.0),
                            cursorHeight: 20.0,
                            onChanged: (String value) {
                              inputTitle = value;
                            },
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 2.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text('Folder',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13.0)),
                              Expanded(child: SizedBox()),
                              Text('Date'),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.tag,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {}),
                              IconButton(
                                icon: Icon(
                                  Icons.flag,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                                color: Colors.grey,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.message,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                                color: Colors.grey,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    Task task = new Task();
                                    task.title = inputTitle;
                                    tasks.add(task);
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ));
        });
  }
}

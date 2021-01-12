import 'package:app_test/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:app_test/domain/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:app_test/widgets/bottom_menu.dart';
import 'package:table_calendar/table_calendar.dart';

class TasksList extends StatefulWidget {
  List tasks;
  TasksList(this.tasks);

  @override
  State<StatefulWidget> createState() {
    return TasksListState(tasks);
  }
}

class TasksListState extends State<TasksList> {
  List<Task> tasks;
  TasksListState(this.tasks);
  String inputTitle;
  String filterType = "today";
  CalendarController controller = new CalendarController();

  Widget createAppBar(String name) {
    return AppBar(
        title: Text(name, style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: Color(0xFF55a3d6),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ]);
  }

  Widget showListOfPodtask(int index) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 35.0),
            itemCount: tasks.elementAt(index).getListOfPodtasks.length,
            itemBuilder: (BuildContext context, int i) {
              return CheckboxListTile(
                value: false,
                title: Text(tasks
                    .elementAt(index)
                    .getListOfPodtasks
                    .elementAt(i)
                    .toString()),
                onChanged: (value) {
                  value = true;
                },
              );
            }));
  }

  Widget taskWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int i) {
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(tasks.elementAt(i).title),
                      tileColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                      onTap: () => showInfoAboutTask(i, context),
                      leading: new IconButton(
                          icon: new Icon(tasks.elementAt(i).isCompleted == false
                              ? Icons.radio_button_off
                              : Icons.radio_button_checked),
                          onPressed: () {
                            tasks.elementAt(i).isCompleted = true;
                            setState(() {
                              tasks.removeAt(i);
                            });
                          }),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 2.0,
                    ),
                  ]),
              secondaryActions: [
                IconSlideAction(
                  caption: 'Edit',
                  color: Colors.green,
                  icon: Icons.edit,
                  onTap: () {},
                ),
              ],
            );
          }),
    );
  }

  void showInfoAboutTask(int index, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.water_damage_outlined),
                title: Text("Name of Future Folder"),
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Row(children: <Widget>[
                Checkbox(
                    value: false,
                    onChanged: (value) {
                      Navigator.pop(context);
                      setState(() {
                        tasks.removeAt(index);
                      });
                    }),
                Text(
                  tasks.elementAt(index).getTitle,
                  style: TextStyle(fontSize: 20),
                )
              ]),
              Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.message, color: Colors.grey),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.style, color: Colors.grey),
                        onPressed: () {},
                      )
                    ],
                  )),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.assistant_photo_outlined),
                title: Text('Podtasks', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 100),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: FlatButton(
                            //new podtask
                            onPressed: () {
                              setState(() {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        children: <Widget>[
                                          TextField(
                                            onChanged: (String value) {
                                              inputTitle = value;
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                              labelText: 'New podtask',
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(Icons.message,
                                                    color: Colors.grey),
                                                onPressed: () {},
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.style,
                                                    color: Colors.grey),
                                                onPressed: () {},
                                              ),
                                              Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: IconButton(
                                                  icon: Icon(Icons.send),
                                                  onPressed: () {
                                                    setState(() {
                                                      tasks
                                                          .elementAt(index)
                                                          .getListOfPodtasks
                                                          .add(inputTitle);
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    });
                              });
                            },
                            child: ListTile(
                              leading: Icon(Icons.add),
                              title: Text('Add podtask',
                                  style: TextStyle(fontSize: 15)),
                            ))),
                    //showListOfPodtask(index),
                  ],
                ),
              )
            ],
          );
        });
  }

  void addNewTask(BuildContext context) {
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
                              Text('DATE'),
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: createAppBar('Home'),
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          //topbar today/calendar
          Container(
            height: 60,
            color: Color(0xFF55a3d6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        changeFilter("today");
                        print('today');
                      },
                      child: Text("Today",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 4,
                      width: 120,
                      color: (filterType == "today")
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        changeFilter("calendar");
                        print('calendar');
                      },
                      child: Text("Calendar",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 4,
                      width: 120,
                      color: (filterType == "calendar")
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 60),
              child: (filterType == "calendar")
                  ? TableCalendar(
                      calendarController: controller,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      initialCalendarFormat: CalendarFormat.week,
                    )
                  : Container()),
          taskWidget(),
        ],
      ),
      bottomNavigationBar: BottomMenu(this.addNewTask, tasks),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2c6992),
          splashColor: Color(0xFF4690c1),
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            addNewTask(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }
}

import 'package:app_test/domain/project.dart';
import 'package:app_test/widgets/bottom_menu.dart';
import 'package:app_test/screens/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProjectList extends StatefulWidget {
  final Function(BuildContext) addNewTask;
  List tasks;

  ProjectList(this.addNewTask, this.tasks);

  @override
  State<StatefulWidget> createState() {
    return ProjectListState(tasks);
  }
}

class ProjectListState extends State<ProjectList> {
  List tasks;
  ProjectListState(this.tasks);

  ListOfProjects projects = new ListOfProjects();
  String inputTitle;

  Widget createAppBar(String name) {
    return AppBar(
        title: Text(name, style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: Color(0xFF55a3d6),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => createNewProject(),
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.more_horiz_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ]);
  }

  void createNewProject() {
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
                        children: [
                          TextField(
                            style: TextStyle(fontSize: 20.0),
                            cursorHeight: 20.0,
                            onChanged: (String value) {
                              inputTitle = value;
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                Project project = new Project();
                                project.title = inputTitle;
                                projects.getListOfProjects.add(project);
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  )));
        });
  }

  Widget showListOfProjects() {
    return ListView.builder(
        itemCount: projects.getListOfProjects.length,
        itemBuilder: (BuildContext context, int i) {
          return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.3,
              secondaryActions: [
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    setState(() {
                      projects.getListOfProjects.removeAt(i);
                    });
                  },
                ),
              ],
              child: Column(
                children: [
                  ListTile(
                    tileColor: Colors.white,
                    title:
                        Text(projects.getListOfProjects.elementAt(i).getTitle),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () => setState(() => projects.getListOfProjects
                              .elementAt(i)
                              .visibilityTasks =
                          !projects.getListOfProjects
                              .elementAt(i)
                              .visibilityTasks),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                  ),
                  Divider(height: 2.0, color: Colors.grey),
                  Visibility(
                    child: CheckboxListTile(
                      value: false,
                      title: Text("hello"),
                      onChanged: (value) {
                        value = true;
                      },
                    ),
                    visible:
                        projects.getListOfProjects.elementAt(i).visibilityTasks,
                  )
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: createAppBar('Projects'),
      drawer: AppDrawer(),
      body: showListOfProjects(),
      bottomNavigationBar: BottomMenu(
        widget.addNewTask,
        tasks,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2c6992),
          splashColor: Color(0xFF4690c1),
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () => widget.addNewTask(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

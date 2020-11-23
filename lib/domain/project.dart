import 'package:app_test/domain/task.dart';

class Project {
  String title;
  String paragraph;
  List<Task> listOfTasks = List();

  Project({this.title, this.paragraph});

  String get getTitle => title;

  set setTitle(String title) {
    this.title = title;
  }

  String get getParagraph => paragraph;

  set setParagraph(String paragraph) {
    this.paragraph = paragraph;
  }
}

class ListOfProjects {
  List<Project> projects = List();

  List<Project> get getListOfProjects => projects;
}

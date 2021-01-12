class Task {
  final int id;
  String title;
  List<String> listOfPodtasks = List();
  String date;
  String projectName;
  bool isCompleted = false;

  List<String> get getListOfPodtasks => listOfPodtasks;

  String get getTitle => title;

  set setTitle(String title) {
    this.title = title;
  }

  Task({this.id, this.title});
}

class ListOfTasks {
  List<Task> tasks = List();

  List<Task> get getListOfTasks => tasks;
}

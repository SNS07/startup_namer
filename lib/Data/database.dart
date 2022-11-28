import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List toDoList = [];
  final _mybox = Hive.box("mybox");

  void createInitialData() {
    toDoList = [
      ["Welcome To Todo List", false],
      ["Start Adding Task", true],
    ];
  }

  void loadData() {
    _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}

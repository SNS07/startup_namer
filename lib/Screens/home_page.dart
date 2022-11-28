import 'package:flutter/material.dart';
import 'package:startup_namer/Components/dialog_box.dart';
import 'package:startup_namer/Components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ["My First Task", true],
    ["My Second Task", false]
  ];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 245, 157),
        appBar: AppBar(
          title: const Text('TO DO'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addToDoList,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: ((context, index) {
              return ToDoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            })));
  }

  checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void addToDoList() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: saveText,
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  void saveText() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }
}

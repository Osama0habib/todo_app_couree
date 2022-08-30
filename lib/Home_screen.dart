import 'package:flutter/material.dart';
import 'package:todo_app_couree/screens/archive.dart';
import 'package:todo_app_couree/screens/done.dart';
import 'package:todo_app_couree/screens/tasks.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> widgets = [
    Tasks(),
    Done(),
    Archive(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_sharp), label: "Tasks",),
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Done"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Archive"),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });

          print(currentIndex);
        },
        currentIndex: currentIndex,
      ),
      body:widgets[currentIndex],
    );
  }
}

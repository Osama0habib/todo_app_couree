import 'package:flutter/material.dart';
import 'package:todo_app_couree/DatabaseUtil.dart';
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
  bool isBottomSheetShow = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<Widget> widgets = [
    Tasks(),
    Done(),
    Archive(),
  ];
  GlobalKey<ScaffoldState> scaffholdKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffholdKey,
      appBar: AppBar(
        title: Text("ToDo"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {

            if (!isBottomSheetShow) {
              scaffholdKey.currentState?.showBottomSheet((context) {
                return BottomSheet(
                    onClosing: () {},
                    builder: (context) {
                      return Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Add a Title";
                                    }
                                  },
                                  controller: titleController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      prefixIcon: Icon(Icons.title))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Add a Title";
                                    }
                                  },
                                  controller: bodyController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      prefixIcon: Icon(Icons.task_outlined))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Add a Title";
                                    }
                                  },
                                  controller: timeController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      prefixIcon: Icon(Icons.access_time_filled))),
                            ),
                          ],
                        ),
                      );
                    });
              });
              isBottomSheetShow = true;
            } else {
              if(formkey.currentState!.validate()){
                DatabaseUtil.db.insert("todo.db", {"title" : titleController.text , "body" : bodyController.text , "time" : timeController.text});
                Navigator.pop(context);
                isBottomSheetShow = false;
              }

            }
          },
          child: Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_sharp),
            label: "Tasks",
          ),
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
      body: widgets[currentIndex],
    );
  }
}

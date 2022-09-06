import 'package:flutter/material.dart';
import 'package:todo_app_couree/DatabaseUtil.dart';
import 'package:todo_app_couree/screens/widgets/list_item.dart';

class Tasks extends StatelessWidget {
   Tasks({Key? key}) : super(key: key);


  // List<String> strings = [
  //   "ahmed",
  //   "حسام",
  //   "3treees",
  //   "zed",
  //   "3beeed",
  //   "ahmed",
  //   "mohamoed",
  //   "3treees",
  //   "zed",
  //   "3beeed",
  // ];

  @override
  Widget build(BuildContext context) {
   List<Map> tasks = DatabaseUtil.tasks;
    return ListView.builder(
      itemCount : tasks.length ,
      itemBuilder: (BuildContext context, int index) {
      return  ListItem( task: tasks[index],);
      },);
  }
}

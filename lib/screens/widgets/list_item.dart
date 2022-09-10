import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_couree/models/task_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key,required this.task})
      : super(key: key);
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(radius: 40, child: FittedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Text(task.time!.split("/").last),
            ),
          ),
        )),
        title: Text(task.title!),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(task.body!),
          Text(task.time!.split("/").first),
        ],),
        isThreeLine: true,


      ),
    );
  }
}

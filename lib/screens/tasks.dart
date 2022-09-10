import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_couree/DatabaseUtil.dart';
import 'package:todo_app_couree/models/task_model.dart';
import 'package:todo_app_couree/provider/todo_provider.dart';
import 'package:todo_app_couree/screens/widgets/list_item.dart';

class Tasks extends StatelessWidget {
   Tasks({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (BuildContext context, provider,_) {

       List<TaskModel> tasks = provider.task;

        return ListView.builder(
        itemCount : tasks.length ,
        itemBuilder: (BuildContext context, int index) {
        return  ListItem( task: tasks[index],);
        },);
      }
    );

  }
}

import 'package:flutter/material.dart';
import 'package:todo_app_couree/DatabaseUtil.dart';

import '../models/task_model.dart';

// class TodoProvider with ChangeNotifier {
//   List<TaskModel> _tasks = [];
//
//   List<TaskModel> get tasks {
//     return [..._tasks];
//   }
//
//   Future<void> getFromDb() async {
//     await DatabaseUtil.db
//         .query(
//       "task",
//     )
//         .then((task) {
//       for (var element in task) {
//         _tasks.add(TaskModel.fromJson(element));
//       }
//     }).then((value) {
//       notifyListeners();
//     });
//   }
//
//   Future<void> insertToDatabase(TaskModel taskModel) async {
//     await DatabaseUtil.db.insert("task", {
//       "title": taskModel.title,
//       "body": taskModel.body,
//       "time": taskModel.time,
//       "status": 1
//     }).then((value)async {
//      await getFromDb();
//     });
//   }
//
//   void updateToDatabase(id,status) async {
//     await DatabaseUtil.db.update(
//         "task",
//         {
//           "status": status
//         },
//         where: "id = $id").then((value)async {
//       await getFromDb();
//     });
//   }
//
//   void deleteFromDatabase(id) async {
//     await DatabaseUtil.db.delete("task", where: id).then((value)async {
//       await getFromDb();
//     });
//   }
// }


class TodoProvider with ChangeNotifier {

  List<TaskModel> _tasks = [];
  List<TaskModel> _done = [];
  List<TaskModel> _archived = [];


  List<TaskModel> get task => [..._tasks];
  List<TaskModel> get done => [..._done];
  List<TaskModel> get archived => [..._archived];

  Future<void> getFromDb() async {
    _tasks = [];
    await DatabaseUtil.db.query("task",)
        .then((task) {
      task.forEach((element) {
        print(element);
        // if(element["status"] == 1) {
        //   _tasks.add(TaskModel.fromMap(element));
        // }else if()
      });
    }).then((value) {
      notifyListeners();
    });
  }

  Future<void> insertToDatabase(TaskModel taskModel) async {
    await DatabaseUtil.db.insert("task", taskModel.toMap()).then((value)async {
     await getFromDb();
    });
  }

  void updateToDatabase(id,status) async {
    await DatabaseUtil.db.update(
        "task",
        {"status": status},
        where: "id = $id").then((value)async {
      await getFromDb();
    });
  }

  void deleteFromDatabase(id) async {
    await DatabaseUtil.db.delete("task", where: id).then((value)async {
      await getFromDb();
    });
  }

}
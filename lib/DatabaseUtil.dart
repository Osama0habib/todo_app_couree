import 'package:sqflite/sqflite.dart';
import 'package:todo_app_couree/models/task_model.dart';

class DatabaseUtil {
  static late Database db;
  static List<TaskModel> tasks = [];

  static Future<void> openDB() async {
     await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (dbs, version) async {

        print("database Created");
        await dbs.execute(
            'CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT, body TEXT, time TEXT ,status INTEGER)');
      },
      onOpen: (dbs) async {
        db = dbs;
        print("database Opened");
        // await getFromDB();
       // await db.insert("task", {"title" : "flutter project", "body" : "learn about sqflite","time" : DateTime.now().toString() , "status" : 1});
      },
    ).catchError((error) {});
  }

  // Future<void> insertToDatabase(TaskModel taskModel) async {
  //   await DatabaseUtil.db.insert("task", taskModel.toMap()).then((value)async {
  //     // await getFromDb();
  //   });
  // }
  //
  // //
  // static getFromDB()async {
  //   await db.query('task',).then((value) {
  //
  //     value.forEach((task) {
  //       tasks.add(TaskModel.fromMap(task));
  //     });
  //     print(tasks);
  //  });
  // }

//
// Future<void> getFromDb() async {
//   await DatabaseUtil.db
//       .query(
//     "task",
//   )
//       .then((task) {
//     for (var element in task) {
//       _tasks.add(TaskModel.fromJson(element));
//     }
//   }).then((value) {
//     notifyListeners();
//   });
}
// }

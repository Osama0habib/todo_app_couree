import 'package:sqflite/sqflite.dart';

class DatabaseUtil {
  static late Database db;
  static List<Map> tasks = [];

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

  static Future<void> insertToDatabase(title ,body , time )async{
   await db.insert("task", {"title" : title , "body" : body , "time" : time ,"status" : 1}).then((value) {
     getFromDataBase();
   });
  }


  static Future<void> getFromDataBase()async{
    await db.query("task",).then((task) {
      print(task);
      tasks = task;
    });
  }

  void updateToDatabase(id,title ,body , time ,status )async{
    await db.update("task", {"title" : title , "body" : body , "time" : time ,"status" : status},where: "id = $id");
  }

  void deleteFromDatabase(id)async{
    await db.delete("task", where: id);
  }
  //
  // static getFromDB()async {
  //   await db.query('task',).then((value) {
  //     tasks = value;
  //     print(tasks);
  //  });
  }
// }

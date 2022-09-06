import 'package:sqflite/sqflite.dart';

class DatabaseUtil {
 static late Database db;

  static Future<void> openDB() async {
    db = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (dbs, version) async {
        await db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, body TEXT, time TEXT ,status INTEGER)');
      },
      onOpen: (db){
        
      },
    );
  }
}

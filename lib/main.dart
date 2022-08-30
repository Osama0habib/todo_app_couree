import 'package:flutter/material.dart';
import 'package:todo_app_couree/DatabaseUtil.dart';
import 'package:todo_app_couree/Home_screen.dart';
// import 'package:todo_app_couree/local_database_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseUtil.openDB();
  // await LocalDataBaseUtility().openMyDataBase();
  // await LocalDataBaseUtility().getFromDAtaBase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// print(LocalDataBaseUtility.tasks);

    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

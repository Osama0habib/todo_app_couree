import 'package:flutter/material.dart';
import 'package:todo_app_couree/Home_screen.dart';

void main() {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: HomeScreen(),debugShowCheckedModeBanner: false,);
  }
}

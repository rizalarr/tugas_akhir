import 'package:flutter/material.dart';
import 'package:tugas_akhir/loginPage.dart';
import 'package:tugas_akhir/model/Todo.dart';
import 'package:hive_flutter/adapters.dart';

String boxName = "To Do Box";

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<ToDoModel>(ToDoModelAdapter());
  await Hive.openBox<ToDoModel>(boxName);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(),
    );
  }
}
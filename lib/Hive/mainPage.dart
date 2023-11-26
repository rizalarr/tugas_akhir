import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tugas_akhir/main.dart';
import 'package:tugas_akhir/model/Todo.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  late Box<ToDoModel> _myBox;

  @override
  void initState() {
    super.initState();
    _myBox = Hive.box(boxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Data'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueGrey],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _myBox.listenable(),
        builder: (context, value, child) {
          if (_myBox.values.isEmpty) {
            return Center(
              child: Text("File KOSONG"),
            );
          }
          return ListView.builder(
            itemCount: _myBox.values.length,
            itemBuilder: (context, index) {
              ToDoModel? res = _myBox.getAt(index);
              return Dismissible(
                onDismissed: (direction) {
                  _myBox.deleteAt(index);
                },
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                ),
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text("Title: ${res!.Title}"),
                    subtitle: Text("Description: ${res.Desc}"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

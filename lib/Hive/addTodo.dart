import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tugas_akhir/main.dart';
import 'package:tugas_akhir/model/Todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
        title: const Text('Add Data'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              '../assets/gambar3.jpg', // Replace with your image asset
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _myBox.add(
                  ToDoModel(
                    Title: _titleController.text,
                    Desc: _descController.text,
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background color
                onPrimary: Colors.white, // text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

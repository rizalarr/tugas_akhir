import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tugas_akhir/main.dart';
import 'package:tugas_akhir/model/Todo.dart';
import 'package:tugas_akhir/Halaman%20API/halaman_api.dart';
import 'package:tugas_akhir/Hive/addTodo.dart';
import 'package:tugas_akhir/halaman_profil.dart';
import 'package:tugas_akhir/halaman_utama.dart';
import 'package:tugas_akhir/kesan.dart';
import 'package:tugas_akhir/konversi/konversi_uang.dart';
import 'package:tugas_akhir/konversi/konversi_waktu.dart';

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
        title: const Text('Data Mario'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 97, 35, 35), 
      ),
       drawer: CustomDrawer(),
       backgroundColor: Color.fromARGB(248, 203, 158, 150),
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
                    title: Text("Nama : ${res!.Title}"),
                    subtitle: Text("Deskripsi : ${res.Desc}"),
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

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(248, 214, 201, 199),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(248, 214, 201, 199),
              
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/gambar_drawer1.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'MARIO TABAH',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Halaman Utama'),
            leading: Icon(Icons.home, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text('Profil'),
            leading: Icon(Icons.account_circle, color: Colors.blue),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => profil()),
              );
            },
          ),
          ListTile(
            title: Text('Mario GAMES'),
            leading: Icon(Icons.games, color: Colors.green),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => halaman_users()),
              );
            },
          ),
          ListTile(
            title: Text('Mario PLUS'),
            leading: Icon(Icons.add, color: Colors.orange),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTodo()),
              );
            },
          ),
          ListTile(
            title: Text('Mario SEE'),
            leading: Icon(Icons.visibility, color: Colors.purple),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyDashboard()),
              );
            },
          ),
          ListTile(
            title: Text('Mario MONEY'),
            leading: Icon(Icons.attach_money, color: Colors.yellow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrencyConverter()),
              );
            },
          ),
          ListTile(
            title: Text('Mario TIME'),
            leading: Icon(Icons.access_time, color: Colors.red),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => konversiwaktu()),
              );
            },
          ),
          ListTile(
            title: Text('Kesan dan Pesan'),
            leading: Icon(Icons.message, color: Colors.teal),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => kesanpesan()),
              );
            },
          ),
        ],
      ),
    );
  }
}

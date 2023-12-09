import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/Halaman%20API/halaman_api.dart';
import 'package:tugas_akhir/Hive/addTodo.dart';
import 'package:tugas_akhir/Hive/mainPage.dart';
import 'package:tugas_akhir/camera/camera.dart';
import 'package:tugas_akhir/halaman_profil.dart';
import 'package:tugas_akhir/kesan.dart';
import 'package:tugas_akhir/konversi/konversi_uang.dart';
import 'package:tugas_akhir/konversi/konversi_waktu.dart';
import 'package:tugas_akhir/loginPage.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tugas_akhir/main.dart';
import 'package:tugas_akhir/model/Todo.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences logindata;
  late String username;
  late Box<ToDoModel> _myBox;


  @override
  void initState() {
    super.initState();
    _myBox = Hive.box(boxName);
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mario App',
          style: TextStyle(color: Colors.black, fontSize: 20.0,  fontWeight: FontWeight.bold),
          
          ),
         backgroundColor: Colors.transparent,
         elevation: 0,
        //backgroundColor: Color.fromARGB(255, 97, 35, 35), 
        actions: [
          IconButton(
            icon: Icon(Icons.camera),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => camera()),
              );
            },
          ),
          IconButton(
            onPressed: () {
              logindata.setBool('login', true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyLoginPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(248, 203, 158, 150),
      drawer: CustomDrawer(), 

      body: ListView(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HorizontalCard('Profil', 'assets/image1.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => profil()),
                        );
                      }),
                      HorizontalCard('Mario Game', 'assets/gambar2.png', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => halaman_users()),
                        );
                      }),
                      HorizontalCard('Mario PLUS', 'assets/gambar3.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddTodo()),
                        );
                      }),
                      HorizontalCard('Mario DATA', 'assets/gambar4.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyDashboard()),
                        );
                      }),
                      HorizontalCard('Mario MONEY', 'assets/gambar5.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CurrencyConverter()),
                        );
                      }),
                      HorizontalCard('Mario TIME', 'assets/gambar6.jpg', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => konversiwaktu()),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),

                Card(
                color: Color.fromARGB(248, 237, 220, 217), 
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      'Data Tersimpan',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    ValueListenableBuilder(
                      valueListenable: _myBox.listenable(),
                      builder: (context, value, child) {
                        if (_myBox.values.isEmpty) {
                          return Center(
                            child: Text("File KOSONG"),
                          );
                        } else {
                          return Column(
                            children: _myBox.values.map((res) {
                              return ListTile(
                                title: Text("Nama Mario: ${res.Title}"),
                                subtitle: Text("Description     : ${res.Desc}"),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
                SizedBox(height: 16.0),
                Card(
                      color: Color.fromARGB(248, 237, 220, 217), // Change the color as needed
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Column(
                        children: [
                          SizedBox(height: 8.0),
                          Text(
                            'Deskripsi Aplikasi',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            child: Text(
                              'Aplikasi bernama MARIO APP. didalam nya terdapat beberapa fitur yang disuguhkan antaira lain fitur profil, mario game, tambah data, dan lihat data. masih banyak fitur yang dapat di explore didalam app ini',
                              style: TextStyle(fontSize: 15.0),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                SizedBox(height: 16.0),

                // Footer Kontak Service
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Email',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Telepon',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  HorizontalCard(this.title, this.imagePath, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
         //color: Color.fromARGB(248, 237, 220, 217),
        child: Container(
          width: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 80.0,
                width: 80.0,
              ),
              SizedBox(height: 8.0),
              Text(title),
            ],
          ),
        ),
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

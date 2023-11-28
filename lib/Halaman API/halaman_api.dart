import 'package:flutter/material.dart';
import 'package:tugas_akhir/API/api_data_source.dart';
import 'package:tugas_akhir/API/users_model.dart';
import 'package:tugas_akhir/Halaman%20API/detail_api.dart';
import 'package:tugas_akhir/Hive/addTodo.dart';
import 'package:tugas_akhir/Hive/mainPage.dart';
import 'package:tugas_akhir/halaman_profil.dart';
import 'package:tugas_akhir/halaman_utama.dart';
import 'package:tugas_akhir/kesan.dart';
import 'package:tugas_akhir/konversi/konversi_uang.dart';
import 'package:tugas_akhir/konversi/konversi_waktu.dart';

class halaman_users extends StatefulWidget {
  const halaman_users({Key? key});

  @override
  State<halaman_users> createState() => _halaman_usersState();
}

class _halaman_usersState extends State<halaman_users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Mario'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 97, 35, 35), 
      ),
       drawer: CustomDrawer(),
       backgroundColor: Color.fromARGB(248, 203, 158, 150),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadgame(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error bro'),
            );
          }
          if (snapshot.hasData) {
            Game users = Game.fromJson(snapshot.data!);
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: users.amiibo!.length,
              itemBuilder: (context, index) {
                var usr = users.amiibo![index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UserDetail(
                                user: usr,
                                idUser: usr.head.toString(),
                              );
                            },
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(2.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(usr.image!),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            usr.name!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
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
          DrawerHeader(
            decoration: BoxDecoration(
              //color: Color.fromARGB(255, 68, 26, 26), 
              image: DecorationImage(
                image: AssetImage('assets/gambar_drawer1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
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

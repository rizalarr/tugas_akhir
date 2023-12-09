import 'package:flutter/material.dart';
import 'package:tugas_akhir/Halaman%20API/halaman_api.dart';
import 'package:tugas_akhir/Hive/addTodo.dart';
import 'package:tugas_akhir/Hive/mainPage.dart';
import 'package:tugas_akhir/halaman_profil.dart';
import 'package:tugas_akhir/halaman_utama.dart';
import 'package:tugas_akhir/konversi/konversi_uang.dart';
import 'package:tugas_akhir/konversi/konversi_waktu.dart';

class kesanpesan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan dan Kesan'),
        backgroundColor: Color.fromARGB(255, 97, 35, 35), 
        centerTitle: true,
      ),
       backgroundColor: Color.fromARGB(248, 203, 158, 150),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
  
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Profile.jpg'), 
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(75),
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pesan : ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'pembelajaran yang sudah sangat sesuai dan menyenangkan, jikalau bisa tambah lagi durasi pengerjaan tugas menjadi 1 bulan atau 2 bulan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kesan : ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Tugas tugas yang diberikan benar benar mantab, karena tugas itu jadi belajar :(, ya walaupun 3 hari tidak tidur :)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Berikan Pesan dan Kesan'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 97, 35, 35),
                onPrimary: Colors.white,
              ),
            ),
          ],
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

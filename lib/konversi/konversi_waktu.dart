import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir/Halaman%20API/halaman_api.dart';
import 'package:tugas_akhir/Hive/addTodo.dart';
import 'package:tugas_akhir/Hive/mainPage.dart';
import 'package:tugas_akhir/halaman_profil.dart';
import 'package:tugas_akhir/halaman_utama.dart';
import 'package:tugas_akhir/kesan.dart';
import 'package:tugas_akhir/konversi/konversi_uang.dart';


class konversiwaktu extends StatefulWidget {
  @override
  _konversiwaktuState createState() => _konversiwaktuState();
}

class _konversiwaktuState extends State<konversiwaktu> {
  final TextEditingController _timeController = TextEditingController();
  String _selectedTimeZone = 'WIB'; //zona default
  String _convertedTime = ''; //menyimpan waktu yang tekah dikonversi
  Map<String, int> _timeZoneOffsets = {'WIB': 7, 'WITA': 8, 'WIT': 9, 'Amerika': -5}; //memtakan zona waktu ke masing2 wilayah
  Map<String, String> _timeZoneLabels = {'WIB': 'WIB', 'WITA': 'WITA', 'WIT': 'WIT', 'Amerika': 'Amerika'};

  void _convertTime() {
    try {
      String inputTime = _timeController.text;
      DateTime dateTime = DateFormat('HH:mm').parse(inputTime);
      int offset = _timeZoneOffsets[_selectedTimeZone] ?? 0;

      _convertedTime = DateFormat('HH:mm').format(dateTime.toUtc().add(Duration(hours: offset)));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Mario TIME'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 97, 35, 35),
      ),
      drawer: CustomDrawer(), 
      backgroundColor: Color.fromARGB(248, 203, 158, 150),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset(
              'assets/gambar6.jpg',
            height: 200,
            width: 300,
            fit: BoxFit.cover, 
            ),
            SizedBox(height: 50),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Masukkan waktu (hh:mm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedTimeZone,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTimeZone = newValue!;
                });
              },
              items: _timeZoneLabels.keys.map((String timeZone) {
                return DropdownMenuItem<String>(
                  value: timeZone,
                  child: Text(_timeZoneLabels[timeZone]!),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _convertTime();
                });
              },
              child: Text('Konversi'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 97, 35, 35),
                onPrimary: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 33, 32, 32)), 
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '$_selectedTimeZone: $_convertedTime',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: const Color.fromARGB(255, 33, 32, 32),
                ),
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

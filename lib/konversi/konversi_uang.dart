import 'package:flutter/material.dart';
import 'package:tugas_akhir/Halaman%20API/halaman_api.dart';
import 'package:tugas_akhir/Hive/addTodo.dart';
import 'package:tugas_akhir/Hive/mainPage.dart';
import 'package:tugas_akhir/halaman_profil.dart';
import 'package:tugas_akhir/halaman_utama.dart';
import 'package:tugas_akhir/kesan.dart';
import 'package:tugas_akhir/konversi/konversi_waktu.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double inputAmount = 0.0;
  double convertedAmount = 0.0;
  String selectedFromCurrency = 'Rupiah';
  String selectedToCurrency = 'USD';

  Map<String, double> exchangeRates = {
    'Rupiah': 14000,
    'USD': 1.0,
    'SAR': 3.7,
    'MYR': 3.5,
  };

  void convertCurrency() {
    setState(() {
      double fromRate = exchangeRates[selectedFromCurrency] ?? 1.0;
      double toRate = exchangeRates[selectedToCurrency] ?? 1.0;
      convertedAmount = (inputAmount * toRate) / fromRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Mario MONEY'),
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
              'assets/gambar5.jpg',
              height: 200,
              width: 300,
              fit: BoxFit.cover, 
            ),
            SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.red,
                labelText: 'Masukkan Jumlah',
                border: OutlineInputBorder(), 
              ),
              
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: selectedFromCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFromCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
                Icon(Icons.arrow_forward, size: 30), 
                DropdownButton<String>(
                  value: selectedToCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedToCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Konversi'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, 
                onPrimary: Colors.white,
              ),
            ),
            SizedBox(height: 20),
           Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 25, 24, 24)), 
                borderRadius: BorderRadius.circular(10.0), 
              ),
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Hasil Konversi: ${convertedAmount.toStringAsFixed(2)} $selectedToCurrency',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: const Color.fromARGB(255, 30, 29, 29),
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

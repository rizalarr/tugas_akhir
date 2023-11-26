import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class konversiwaktu extends StatefulWidget {
  @override
  _konversiwaktuState createState() => _konversiwaktuState();
}

class _konversiwaktuState extends State<konversiwaktu> {
  final TextEditingController _timeController = TextEditingController();
  String _selectedTimeZone = 'WIB';
  String _convertedTime = '';
  Map<String, int> _timeZoneOffsets = {'WIB': 7, 'WITA': 8, 'WIT': 9, 'Amerika': -5};
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
      appBar: AppBar(
        title: const Text('Mario TIME'),
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
              '../assets/gambar6.jpg', 
              height: 200, 
              width: 300,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Masukkan waktu (HH:mm)'),
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
            ),
            SizedBox(height: 20),
            Text('$_selectedTimeZone: $_convertedTime'),
          ],
        ),
      ),
    );
  }
}

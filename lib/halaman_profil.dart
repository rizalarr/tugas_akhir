import 'package:flutter/material.dart';

class profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pofil Pengguna'),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('../assets/Profile.jpg'), // Ganti dengan nama file gambar profil Anda
            ),
            SizedBox(height: 20),
            Text(
              'Nama: John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Umur: 20 tahun', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Alamat: Semin, gunungkidul, yogyakarta', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Tanggal Lahir: 08 april 2003', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(
              'Deskripsi Diri:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Saya adalah seseorang yang senang belajar dan berkembang. '
                'Pengalaman saya mencakup pengembangan perangkat lunak dan '
                'saya memiliki minat dalam teknologi terkini.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

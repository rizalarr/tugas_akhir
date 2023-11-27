import 'package:flutter/material.dart';
import 'package:tugas_akhir/API/users_model.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetail extends StatelessWidget {
  final Amiibo user;
  final String idUser;

  const UserDetail({Key? key, required this.user, required this.idUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Mario'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 97, 35, 35), 
      ),
       backgroundColor: Color.fromARGB(248, 203, 158, 150),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: 500, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.network(
                      user.image!,
                      width: 250,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    user.name!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.gameSeries!,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.character!,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL("https://supermario-game.com");
        },
        child: Icon(Icons.search_outlined),
        tooltip: 'Lihat Game',
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  try {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  } catch (e) {
    print('Error launching URL: $e');
  }
}


import 'package:flutter/material.dart';
import 'package:tugas_akhir/API/api_data_source.dart';
import 'package:tugas_akhir/API/users_model.dart';
import 'package:tugas_akhir/Halaman%20API/detail_api.dart';

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
                            width: 150,
                            height: 150,
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

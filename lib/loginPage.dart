import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/halaman_utama.dart';
import 'package:encrypt/encrypt.dart' as encrypt;



class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    checkIfAlreadyLogin();
  }

  void checkIfAlreadyLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (!newuser) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  
String encryptPassword(String password) {
  final key = encrypt.Key.fromLength(32);
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final encryptedPassword = encrypter.encrypt(password, iv: iv);
  return encryptedPassword.base64;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
         elevation: 0,
        automaticallyImplyLeading: false,
      ),
       backgroundColor: Color.fromARGB(248, 203, 158, 150),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60), 
            Icon(Icons.key_off_sharp, size: 200,),
            SizedBox(height: 10), 
            Text(
              "Login Mario",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), 
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20), 
            ElevatedButton( 
              onPressed: () {
              String username = usernameController.text;
              String password = passwordController.text;

              // Enkripsi password sebelum membandingkan

              if (username == 'login' && password == '12345678') {
                String encryptedPassword = encryptPassword(password);
                print(encryptedPassword);
                logindata.setBool('login', false);
                logindata.setString('username', username);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }
            },
              child: Text("Log-In"),
              style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 97, 35, 35),
              onPrimary: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}



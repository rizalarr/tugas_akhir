import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class camera extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  String _imagePath = "";
  final ImagePicker _picker = ImagePicker();

  Future<String> getImage(bool isCamera) async {
    final XFile? image;
    if (isCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }
    return image!.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mario Camera",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 97, 35, 35), 
        centerTitle: true,
      ),
       backgroundColor: Color.fromARGB(248, 203, 158, 150),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                _imagePath = await getImage(false);
                setState(() {});
              },
              icon: Icon(
                Icons.insert_drive_file,
                size: 40,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () async {
                _imagePath = await getImage(true);
                setState(() {});
              },
              icon: Icon(
                Icons.camera_alt,
                size: 40,
                color: Colors.black,
              ),
            ),
            
            SizedBox(height: 20),
            _imagePath.isEmpty
                ? Container()
                : Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Gambar yang Dicapture:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Image.file(
                        File(_imagePath),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// class camera extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState()=>_cameraState();
//   }

// class _cameraState extends State<camera>{
//   String _imagePath = "";
//   final ImagePicker _picker = ImagePicker();
//   Future<String> getImage(bool isCamera) async{
//     final XFile? image;
//     if(isCamera){
//       image = await _picker.pickImage(source:
//       ImageSource.camera);
//       } else {
//         image = await _picker.pickImage(source:
//         ImageSource.gallery);
//         }
//         return image!.path;
//         }

//     @override
//       Widget build(BuildContext context) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text("Image Pick Demo"),
//            backgroundColor: Color.fromARGB(255, 97, 35, 35), 
//            centerTitle: true,
//          ),
//          backgroundColor: Color.fromARGB(248, 203, 158, 150),
          
//           body: Center(
//             child: Column(
//               children: [
//                 IconButton(
//                   onPressed: () async {
//                     _imagePath = await getImage(false);
//                     setState(() {});
//                     },
//                     icon: Icon(Icons.insert_drive_file)),
//                     SizedBox(height: 10,),
//                     IconButton(
//                       onPressed: () async {
//                         _imagePath = await getImage(true);
//                         setState(() {
//                         });
//                         },
//                     icon: Icon(Icons.camera_alt)),
//                     _imagePath.isEmpty ? Container() :
//                     Image.file(File(_imagePath),height: 300, width: 300,),
//               ],
//          ),
//        ),
//     );
//  }
// }

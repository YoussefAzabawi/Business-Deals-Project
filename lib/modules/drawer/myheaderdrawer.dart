import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  late PickedFile _imageFile;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[400],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageProfile(),
          /* Row(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                )
              ),

            ),
          ],
        ),*/

        ],
      ),

    );
  }
  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 65.0,

          backgroundImage:  AssetImage('assets/images/businessman.png',

          ),


          ),
            /*Positioned(
            bottom: 10.0,
            right: 10.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(

                Icons.camera_alt,

                color: Colors.teal,

                size: 28.0,

              ),
            ),

          ),*/
        ],
      ),
    );
  }

  /*Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(''
              'Choose Profile photo',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(onPressed: () {
                takePhoto(ImageSource.camera);
              },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
              FlatButton.icon(onPressed: () {
                takePhoto(ImageSource.gallery);

              },
                icon: Icon(Icons.image),
                label: Text('gallery'),
              ),

            ],
          )

        ],
      ),
    );

  }
  void takePhoto(ImageSource Source)async{
    final pickedFile=await picker.getImage(source: Source,
    );
    setState(() {
      _imageFile=pickedFile!;

    });
  }
*/

}


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: InkWell(
                    onTap: () => getImage(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150.0),
                      child: _image == null
                          ? Image.asset(
                              'assets/placeholder.png',
                              height: 200,
                              width: 200,
                            )
                          : Image.file(
                              _image,
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                    )),
              ),
            ),
            TextField(

            ),
            TextField()
          ],
        ),
      ),
    );
  }
}

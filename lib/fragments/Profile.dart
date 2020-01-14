import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  String _name = "peter samuel",
      _email = "peter@gmail.com",
      _address = "Kuwait, sharq, complex 1",
      _phone = "+965-4568-1234";

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(8),
              child: InkWell(
                  onTap: () => getImage(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150.0),
                    child: _image == null
                        ? Image.asset(
                            'assets/placeholder.png',
                            height: 150,
                            width: 150,
                          )
                        : Image.file(
                            _image,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                  )),
            ),
          ),
          Padding(padding: EdgeInsets.all(12)),
          getInfo(_name, Icons.person, 1),
          getInfo(_email, Icons.email, 2),
          getInfo(_phone, Icons.phone_android, 3),
          getInfo('Kuwait, sharq, complex 11', Icons.business, 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 68),
            child: RaisedButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Map'),
              onPressed: () {},
              color: Colors.blue[300],
              textColor: Colors.white,
              splashColor: Colors.pink[100],
            ),
          ),
        ],
      ),
    );
  }

  getInfo(String str, IconData icon, int position) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                size: 24,
              ),
              Padding(padding: EdgeInsets.all(4)),
              Text(
                str,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              switch (position) {
                case 1:
                  _showDialog(_name, position);
                  break;
                case 2:
                  _showDialog(_email, position);
                  break;
                case 3:
                  _showDialog(_phone, position);
                  break;
                case 4:
                  Map();
                  break;
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.mode_edit,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showDialog(String str, int position) async {
    var txt = TextEditingController();
    txt.text = str;
    return showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: TextField(
          controller: txt,
          decoration: new InputDecoration(
              labelText: 'Full Name', hintText: 'write here'),
          onChanged: (String textType) {
            str = textType;
          },
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('UPDATE'),
              onPressed: () {
                setState(() {
                  switch (position) {
                    case 1:
                      _name = str;
                      break;
                    case 2:
                      _email = str;
                      break;
                    case 3:
                      _phone = str;
                      break;
                  }
                });
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}

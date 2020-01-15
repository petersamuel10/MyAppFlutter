import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authentication _auth = Authentication();
  final _formKey = GlobalKey<FormState>();
  String email = '', password = '', error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/background.jpg',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    decoration: new InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Email',
                      hintText: 'eg. example@yahoo.com',
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (val) =>
                        val.length < 6 ? 'Enter an password' : null,
                    decoration: new InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'password',
                      hintText: '********',
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(12),
                    color: Colors.deepPurple[300],
                    splashColor: Colors.pink[100],
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null)
                          setState(() {
                            error =
                                'Error: may be your email or password wrong !!!';
                          });
                        else {
                          result.toString();
                          Navigator.pushNamed(context, '/home');
                        }
                      }
                    },
                  ),
                  Text(
                    error,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

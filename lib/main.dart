import 'package:flutter/material.dart';
import 'package:myapp/MainDrawer.dart';
import 'package:myapp/Screens/ProductDetails.dart';
import 'package:myapp/Screens/Products.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweety App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainDrawer(),
        '/products': (context) => Products(),
        '/productDetails': (context) => ProductDetails(),
      },
    );
  }
}

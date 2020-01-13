import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}



//
//return ListView.builder(
//itemCount: categories.length,
//itemBuilder: (context, index) {
//return Column(
//children: <Widget>[
//Container(
//color: Colors.white10,
//alignment: Alignment.center,
//height: 150,
//child: Card(
//child: Column(
//mainAxisSize: MainAxisSize.max,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//children: <Widget>[
//ListTile(
//onTap: () => Navigator.push(
//context,
//MaterialPageRoute(
//builder: (context) =>
//Products(category: categories[index]),
//)),
//leading: Image.network(
//"http://assets.villa-vanillaa.com" +
//categories[index].categoryIcon,
//height: 100,
//width: 150,
//fit: BoxFit.fill,
//),
//title: Text(categories[index].categoryTitleEn),
//subtitle: Text(categories[index].categoryTitleEn),
//),
//],
//),
//),
//),
//],
//);
//},
//);
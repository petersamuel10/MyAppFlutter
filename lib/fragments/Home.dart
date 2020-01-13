import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/Products.dart';
import 'package:myapp/model/Category.dart';
import 'package:myapp/model/SliderImage.dart';
import 'package:myapp/services/APIManger.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderImage> images = new List<SliderImage>();
  List<Category> categories = new List<Category>();

//  void getSlideImages() {
//    APIManger instance = new APIManger();
//    instance.getSliderImages().then((response) {
//      setState(() {
//        var responseJson = json.decode(response.body);
//
//        images = (responseJson["slider"] as List)
//            .map((model) => SliderImage.fromJson(model))
//            .toList();
//      });
//    });
//  }

  void getCategories() {
    APIManger instance = new APIManger();
    instance.getCategory().then((response) {
      setState(() {
        var responseJson = json.decode(response.body);
        categories = (responseJson['category_item'] as List)
            .map((p) => Category.fromJson(p))
            .toList();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getSlideImages();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
//        Image.network(
//          "http://assets.villa-vanillaa.com" + categories[0].categoryIcon,
//          height: 200,
//          width: 200,
//          fit: BoxFit.fill,
//        ),
        ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            return Container(
              height: 150,
              child: Card(
                elevation: 2,
                margin: EdgeInsets.all(4),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Products(
                          category: categories[index],
                        ),
                      )),
                  child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            "http://assets.villa-vanillaa.com" +
                                item.categoryIcon,
                            height: 130,
                            width: 140,
                            fit: BoxFit.fill,
                          ),
                          Flexible(
                            child: Center(
                              child: Text(
                                item.categoryTitleEn,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

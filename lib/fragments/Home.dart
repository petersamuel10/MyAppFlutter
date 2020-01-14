import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/Category.dart';
import 'package:myapp/model/SliderImage.dart';
import 'package:myapp/services/APIManger.dart';

import 'CategoryList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  List<SliderImage> images = new List<SliderImage>();
  List<Category> categories = new List<Category>();

  void getSlideImages() {
    APIManger instance = new APIManger();
    instance.getSliderImages().then((response) {
      setState(() {
        var responseJson = json.decode(response.body);

        images = (responseJson["slider"] as List)
            .map((model) => SliderImage.fromJson(model))
            .toList();

        images.add(images[0]);
        images.add(images[0]);
        images.add(images[0]);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.95);
    getSlideImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          imageSlider(),
          Padding(padding: EdgeInsets.all(0.1)),
          Container(
            height: 400,
            child: CategoryList(),
          ),
        ],
      ),
    );
  }

  imageSlider() {
    return Container(
      height: 250,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/slide.jpg'),
          AssetImage('assets/slide2.jpg'),
          AssetImage('assets/slide3.png'),
        ],
//        images: images.map((model) {
//          return new NetworkImage(
//              "http://assets.villa-vanillaa.com" + model.photosPath);
//        }).toList(),
        autoplay: false,
        dotSize: 4.0,
        dotColor: Colors.blue[200],
        indicatorBgPadding: 8.0,
      ),
    );
  }
}

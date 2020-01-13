import 'dart:async';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const baseUrl = "http://app.villa-vanillaa.com/api/";

class APIManger extends StatefulWidget {
  APIManger();

  Future<Response> getSliderImages() async {
    String url = baseUrl+"GetSlider.php";
    Map<String, String> headers = {"Cache-Control": "application/json"};
    Response response = await post(url, headers: headers, body: '');
    return response;
  }

  Future<Response> getCategory() async {
    String url = baseUrl+"GetCategory.php";
    Map<String, String> headers = {"Cache-Control": "application/json"};
    String postData = '{"level":0}';
    Response response = await post(url, headers: headers, body: postData);
    return response;
  }

  Future<Response> getProducts(String categoryId) async {
    String url = baseUrl+"GetProductWhereCategoryID.php";
    Map<String, String> headers = {"Cache-Control": "application/json"};
    String postData = '{"limit":0, "category_id": $categoryId}';
    Response response = await post(url, headers: headers, body: postData);
    return response;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class ApiManager extends StatefulWidget {
  ApiManager();

//  Future<Response> getCategory() async {
//    String url = "http://app.villa-vanillaa.com/api/GetCategory.php";
//    Map<String, String> headers = {"Cache-Control": "application/json"};
//    String postData = '{"level":0}';
//    Response response = await post(url, headers: headers, body: postData);
//    return response;
//  }



  @override
  _ApiManagerState createState() => _ApiManagerState();
}

class _ApiManagerState extends State<ApiManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

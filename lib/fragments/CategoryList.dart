import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/services/APIManger.dart';

import '../Screens/Products.dart';
import '../model/Category.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Category> categories = new List<Category>();

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
    print(categories.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                      CachedNetworkImage(
                        imageUrl: "http://assets.villa-vanillaa.com" +
                            item.categoryIcon,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 130,
                        width: 140,
                        fit: BoxFit.fill,
                      ),
//                      Image(
//                        image: CachedNetworkImageProvider(
//                            "http://assets.villa-vanillaa.com" +
//                                item.categoryIcon),
//
//                      ),
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
    );
  }
}

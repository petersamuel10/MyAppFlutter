import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/Category.dart';
import 'package:myapp/model/Product.dart';
import 'package:myapp/services/APIManger.dart';

import 'ProductDetails.dart';

class Products extends StatefulWidget {
  final Category category;

  Products({Key key, this.category}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Product> products = new List<Product>();

  void getProducts(categoryId) {
    APIManger instance = new APIManger();
    instance.getProducts(categoryId).then((response) {
      setState(() {
        print(response.body);
        var responseJson = json.decode(response.body);
        products = (responseJson['product_item'] as List)
            .map((p) => Product.fromJson(p))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //  category = ModalRoute.of(context).settings.arguments;
    getProducts(widget.category.categoryId);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.category.categoryTitleEn),
        centerTitle: true,
      ),
      body: GridView.count(
        // crossAxisCount is the number of columns
        crossAxisCount: 2,
        // This creates two columns with two items in each column
        children: List.generate(products.length, (index) {
          return Container(
            child: Card(
                elevation: 2,
                child: InkWell(
                  onTap: () =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(
                                  product: products[index],
                                ),
                          )),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: CachedNetworkImage(
                            imageUrl:
                            "http://assets.villa-vanillaa.com" +
                                products[index].productImg,
                          placeholder: (context, url) =>
                              LinearProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0, 1),
                        child: Container(
                          padding: EdgeInsets.all(4.0),
                          color: Colors.black.withAlpha(100),
                          child: Text(
                            products[index].productTitleEn,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }
}

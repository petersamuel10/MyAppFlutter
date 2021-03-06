import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:myapp/main.dart';
import 'package:myapp/model/Product.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    getMessage();
  }

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: Text('Congratulation'),
              content: Text('Product add to your cart successfully'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    showLocalNotification();
                  },
                ),
              ],
            ));
  }
  Future showLocalNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }
  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MyApp()),
    );
  }
  getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 300.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: "http://assets.villa-vanillaa.com" +
                        widget.product.productImg,
                    placeholder: (context, url) => LinearProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment(1, 1),
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    color: Colors.black.withAlpha(100),
                    child: Text(
                      widget.product.productPrice + ' Kd',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        //backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                widget.product.productTitleEn,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.deepPurple[900],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              'A product description is the marketing copy used to describe a product’s'
              ' value proposition to potential customers. A compelling product description provides'
              ' A product description is the marketing copy used to describe a products'
              ' value proposition to potential customers. A compelling product description provides'
              ' customers with details around features, problems it solves and other benefits '
              'to help generate a sale.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
            child: RaisedButton.icon(
              icon: Icon(Icons.shopping_cart),
              label: Text('Add to cart'),
              onPressed: () {
                showAlertDialog();
              },
              color: Colors.blue[300],
              textColor: Colors.white,
              splashColor: Colors.pink[100],
            ),
          ),
        ],
      ),
    );
  }
}

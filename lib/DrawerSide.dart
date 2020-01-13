import 'package:flutter/material.dart';

class DrawerSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sweety'),
        backgroundColor: Colors.red[400],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.deepOrange, Colors.orangeAccent]),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.all(0.1),
                            child: Image.asset(
                              'assets/placeholder.png',
                              width: 95,
                              height: 95,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Peter samuel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ))
                    ],
                  ),
                )),
            CustomListTitle(
                Icons.home,
                'Home',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.pushNamed(context, '/home')
                    }),
            CustomListTitle(
                Icons.shopping_cart,
                'Shopping cart',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.pushNamed(context, '/cart')
                    }),
            CustomListTitle(
                Icons.person,
                'Profile',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.pushNamed(context, '/profile')
                    }),
            CustomListTitle(Icons.exit_to_app, 'Logout', () => {}),
          ],
        ),
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget {
  IconData icon;
  String title;
  Function onTap;

  CustomListTitle(this.icon, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
          ),
          child: InkWell(
            splashColor: Colors.orange,
            onTap: onTap,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
          ),
        ));
  }
}

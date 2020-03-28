import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    mini: true,
                    elevation: 0.0,
                    child: Icon(Icons.shopping_cart,
                        color: Colors.black, size: 17.0),
                  )
                ]),
          )
        ],
      ),
    );
  }
}

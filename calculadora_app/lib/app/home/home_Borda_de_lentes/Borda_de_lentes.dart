import 'package:calculadoraapp/app/home/home_Borda_de_lentes/Propaganda.dart';
import 'package:calculadoraapp/app/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class BordadeLentes extends StatefulWidget {
  const BordadeLentes({Key key}) : super(key: key);

  @override
  _BordadeLentesState createState() => _BordadeLentesState();
}

class _BordadeLentesState extends State<BordadeLentes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icones
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    mini: true,
                    elevation: 0.0,
                    child:
                        Icon(Icons.short_text, color: Colors.black, size: 17.0),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Calculadora de Borda de lentes',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Propaganda(),
          )
        ],
      ),
    );
  }
}

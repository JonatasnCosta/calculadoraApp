import 'package:calculadoraapp/Home.dart';
import 'package:calculadoraapp/MenusTransposicao/TransposicaoAdicao.dart';
import 'package:flutter/material.dart';


class FuncaoAdicao extends StatefulWidget {
  @override
  _FuncaoAdicaoState createState() => _FuncaoAdicaoState();
}

class _FuncaoAdicaoState extends State<FuncaoAdicao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
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
                    Navigator.of(context).pop(MaterialPageRoute(builder:(context) => TransposicaoAdicao()));
                  }
                ),
                FloatingActionButton(
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder:(context) => Home()));
                  },
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  mini: true,
                  elevation: 0.0,
                  child:
                      Icon(
                        Icons.short_text, 
                        color: Colors.black, size: 17.0
                        ),
                )
              ]
              ),
        ),
         Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
            'Calculadora de Adição',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40.0,
                fontWeight: FontWeight.w500),
          ),
        ),
         
        ],
      ),
    );
  }
}
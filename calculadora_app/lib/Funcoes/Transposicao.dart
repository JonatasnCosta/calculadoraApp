import 'package:flutter/material.dart';


class Transposicao extends StatefulWidget {
  @override
  _TransposicaoState createState() => _TransposicaoState();
}

class _TransposicaoState extends State<Transposicao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xff399d63),
          ),
          Positioned(
            bottom: 22.0,
            child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                RotatedBox(quarterTurns: 4, child: Icon(Icons.assessment, color: Colors.white.withOpacity(0.4)),)
                ],
              ),
            ),
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height - 65.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35.0), bottomRight: Radius.circular(35.0)),
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
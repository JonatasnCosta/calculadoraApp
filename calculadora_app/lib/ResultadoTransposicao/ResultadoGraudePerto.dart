import 'package:calculadoraapp/Home.dart';
import 'package:calculadoraapp/SubFuncaoTransposicao/FuncaoGraudePerto.dart';
import 'package:flutter/material.dart';



class ResultadoGraudePerto extends StatefulWidget {

 final double graudePertoOD;
 final double graudePertoOE;
 final double cilOD;
 final double eixoOD;
 final double cilOE;
 final double eixoOE;

  ResultadoGraudePerto( {Key key, @required 
  this.graudePertoOD,
  this.graudePertoOE,
  this.cilOD,
  this.eixoOD,
  this.cilOE,
  this.eixoOE,
  
  }) : super(key: key);

  @override
  _ResultadoGraudePertoState createState() => _ResultadoGraudePertoState();
}

class _ResultadoGraudePertoState extends State<ResultadoGraudePerto> {
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
                    Navigator.of(context).pop(MaterialPageRoute(builder:(context) => FuncaoGraudePerto()));
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
            'Resultado grau de perto',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40.0,
                fontWeight: FontWeight.w500),
          ),
        ),
         Padding(padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 40.0),
          child: Text('Grau para perto:',
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 30.0,
            color: Colors.black),),),
          Row(
            children: <Widget>[
             Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0),
          child: Text("OD + ${widget.graudePertoOD}",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           ),
            Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0),
          child: Text("CIL ${widget.cilOD}",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           ),
            Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0),
          child: Text("EIXO ${widget.eixoOD}",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black),),),],
           )
          ],
          ),
          Row(
          children: <Widget>[
             Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 30.0),
          child: Text("OE + ${widget.graudePertoOE}",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           ),
            Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 30.0),
          child: Text("CIL  ${widget.cilOE} ",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           ),
            Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 30.0),
          child: Text("EIXO ${widget.eixoOE}",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           )
          ],
          ),
          Padding( 
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 5.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Novo Calculo'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder:(context) => FuncaoGraudePerto()));
              }
            ),
           ),
            Padding( 
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 40.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Gerar Ordem de serviço'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: (){}
            ),
          ),
       ],
     ),
    );
  }
}
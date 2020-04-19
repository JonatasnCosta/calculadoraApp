import 'package:calculadoraapp/Home.dart';
import 'package:calculadoraapp/MenusTransposicao/TransposicaoGraudePerto.dart';
import 'package:flutter/material.dart';



class FuncaoGraudePerto extends StatefulWidget {
  @override
  _FuncaoGraudePertoState createState() => _FuncaoGraudePertoState();
}

class _FuncaoGraudePertoState extends State<FuncaoGraudePerto> {
  TextEditingController _controllerEsfOD = TextEditingController();
  TextEditingController _controllerCILOD = TextEditingController();
  TextEditingController _controllerEIXOOD = TextEditingController();

  TextEditingController _controllerEsfOE = TextEditingController();
  TextEditingController _controllerCILOE = TextEditingController();
  TextEditingController _controllerEIXOOE = TextEditingController();

  TextEditingController _controllerADD = TextEditingController();

  String _erro = "";
  
  double graudePertoOD= 0;
  double cilOD= 0;
  double eixoOD= 0;
  
  double graudePertoOE= 0;
  double cilOE= 0;
  double eixoOE= 0;
  


  var
  esfod,
  add,
  eixood,
  esfoe;
  


  void _resultadoGraudePerto(BuildContext context){
  double esfod = double.tryParse(  _controllerEsfOD.text);
  double cilood = double.tryParse(  _controllerCILOD.text);
  double eixood = double.tryParse(  _controllerEIXOOD.text);
  
  double esfoe = double.tryParse(  _controllerEsfOE.text);
  double cilooe = double.tryParse(  _controllerCILOE.text);
  double eixooe = double.tryParse(  _controllerEIXOOE.text);
  
  double add = double.tryParse(  _controllerADD.text);
  
  
  

 if (esfod == null|| esfoe == null) {
   setState(() {
     _erro = "Use somente o ponto (.) para fazer o calculo. ";
   });
 } 
 else {
 setState(() {
   graudePertoOD= esfod + add;
   cilOD= cilood;
   eixoOD = eixood ;


   graudePertoOE= esfoe + add;
   cilOE= cilooe;
   eixoOE = eixooe ;
   
 }
 );
 }
} 

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
                    Navigator.of(context).pop(MaterialPageRoute(builder:(context) => TransposicaoGraudePerto()));
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
            'Calculadora de perto',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40.0,
                fontWeight: FontWeight.w500),
          ),
        ),
         Padding(
            padding: EdgeInsets.only(top: 10.0, left: 70.0, right: 70.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Esf     OD Longe',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerEsfOD,
                 ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cil     OD Longe',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerCILOD,
                 ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0, bottom: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Eixo  OD Longe',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerEIXOOD,
                 ),
              ),
            ),
          ),
         Padding(
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Esf    OE Longe',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerEsfOE,
                 ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cil     OE Longe',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerCILOE,
                 ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0, bottom: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Eixo  OE Longe',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerEIXOOE,
                 ),
              ),
            ),
          ),
         Padding(
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'ADD',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerADD,
                 ),
              ),
            ),
          ),
           Padding( 
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0, bottom: 40.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Calcular'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: (){
              _resultadoGraudePerto(context);
              }
            ),
           ),
           Padding(padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 40.0),
          child: Text('Grau de perto:',
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
          Row(
          children: <Widget>[
             Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 10.0),
          child: Text("OD  $graudePertoOD",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 10.0),
          child: Text("CIL - $cilOD",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 10.0),
          child: Text("EIXO $eixoOD",
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
           Row(
          children: <Widget>[
             Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 10.0),
          child: Text("OE  $graudePertoOE",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 10.0),
          child: Text("CIL - $cilOE ",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 20.0,bottom: 10.0),
          child: Text("EIXO $eixoOE",
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
            Padding(padding: EdgeInsets.only(top: 10.0, left: 70.0, right: 40.0),
          child: Text(_erro,
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          )
        ],
      ),
    );
  }
}
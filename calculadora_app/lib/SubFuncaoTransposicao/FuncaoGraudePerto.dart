import 'package:calculadoraapp/Funcoes/Transposicao.dart';
import 'package:calculadoraapp/Home.dart';
import 'package:flutter/material.dart';
import "package:calculadoraapp/ResultadoTransposicao/ResultadoGraudePerto.dart";



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
  
  double graudePertoOD= 0;
  double cilOD= 0;
  double eixoOD= 0;
  double graudePertoOE= 0;
  double cilOE= 0;
  double eixoOE= 0;
  
  var
  esfODlonge,
  esfOElonge,
  add;

  void _resultadoGraudePerto(BuildContext context){
  double esfODlonge = double.tryParse(  _controllerEsfOD.text);
  double cilODLonge = double.tryParse(  _controllerCILOD.text);
  double eixoODLonge = double.tryParse(  _controllerEIXOOD.text);
  
  double esfOElonge = double.tryParse(  _controllerEsfOE.text);
  double cilOELonge = double.tryParse(  _controllerCILOE.text);
  double eixoOELonge = double.tryParse(  _controllerEIXOOE.text);
  
  double add = double.tryParse(  _controllerADD.text);
  
  if(esfODlonge == null){
  setState(() {
    esfODlonge = 0.0;
  });
}else{
   esfODlonge= esfODlonge;
 }
  
  if(esfOElonge == null){
  setState(() {
    esfOElonge = 0.0;
  });
}else{
   esfOElonge= esfOElonge;
 }
 
 if(esfODlonge == esfODlonge && esfOElonge == esfOElonge){
   
   setState((){
   graudePertoOD= esfODlonge + add;
   cilOD= cilODLonge;
   eixoOD= eixoODLonge;
   
   graudePertoOE= esfOElonge + add;
   cilOE= cilOELonge;
   eixoOE=  eixoOELonge;
   });
 } 
 if(cilOD == null ){
   setState((){
    cilOD= 0.0; 
   });
 }else {
   cilOD= cilODLonge;
 }
 if(eixoOD == null){
   setState((){
    eixoOD= 0.0; 
   });
 }else{
  eixoOD= eixoODLonge; 
 }
 if(cilOE == null){
  setState((){
  cilOE= 0.0;
  }); 
 }else{
   cilOE= cilOELonge;
 }
 if(eixoOE == null){
   setState((){
    eixoOE= 0.0;
   });
 }else{
   eixoOE= eixoOELonge; 
 } 
Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoGraudePerto( 
          graudePertoOD: graudePertoOD = graudePertoOD,
          graudePertoOE: graudePertoOE = graudePertoOE,
          cilOD: cilOD = cilOD,
          eixoOD: eixoOD = eixoOD,
          cilOE:  cilOE=  cilOE,
          eixoOE: eixoOE= eixoOE,
          ),   
        ));
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
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => Transposicao()));
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
                    labelText: 'Esf     OD Longe',
                    labelStyle: TextStyle(
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
                    labelText: 'Cil     OD Longe',
                    labelStyle: TextStyle(
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
                    labelText: 'Eixo  OD Longe',
                    labelStyle: TextStyle(
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
                    labelText: 'Esf    OE Longe',
                    labelStyle: TextStyle(
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
                    labelText: 'Cil     OE Longe',
                    labelStyle: TextStyle(
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
                    labelText: 'Eixo  OE Longe',
                    labelStyle: TextStyle(
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
                    labelText: 'Adição',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 30.0, left: 70.0, right: 70.0, bottom: 5.0),
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
           Padding( 
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0, bottom: 20.0),
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
           )
        ],
      ),
    );
  }
}
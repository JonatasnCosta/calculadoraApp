import 'package:calculadoraapp/Funcoes/Transposicao.dart';
import 'package:calculadoraapp/Home.dart';
import 'package:flutter/material.dart';





class FuncaoCilindricopositivo extends StatefulWidget {
  @override
  _FuncaoCilindricopositivoState createState() => _FuncaoCilindricopositivoState();
}

class _FuncaoCilindricopositivoState extends State<FuncaoCilindricopositivo> {
   TextEditingController _controllerEsfODLonge = TextEditingController();
  TextEditingController _controllerCILOD = TextEditingController();
  TextEditingController _controllerEIXOOD = TextEditingController();

  TextEditingController _controllerEsfOELonge = TextEditingController();
  TextEditingController _controllerCILOE = TextEditingController();
  TextEditingController _controllerEIXOOE = TextEditingController();
  
  double cilOD= 0;
  double eixoOD= 0;
  double cilOE= 0;
  double eixoOE= 0;
  double valorOD=0;
  double valorOE=0;

   _resultadoGrauCilindrico(BuildContext context){
    
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
            'Calculadora de Cilíndrico',
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
                  controller: _controllerEsfODLonge,
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
                    labelText: 'Cil Positivo  OD ',
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
                    labelText: 'Eixo  OD',
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
                  controller: _controllerEsfOELonge,
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
                    labelText: 'Cil Positivo  OE',
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
                    labelText: 'Eixo OE ',
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
            padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0, bottom: 10.0),
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
                _resultadoGrauCilindrico(context);
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
               Navigator.of(context).push(MaterialPageRoute(builder:(context) => FuncaoCilindricopositivo()));
              }
            ),
           ),
            Padding(padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 40.0),
          child: Text('Grau com cilíndrico negativo:',
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
            Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 30.0),
          child: Text("OD $valorOD",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 30.0),
          child: Text("CIL",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 30.0),
          child: Text("EIXO",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           )
          ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 30.0),
          child: Text("OE $valorOE",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 30.0),
          child: Text("CIL ",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 30.0),
          child: Text("EIXO",
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
      ],
      )
    );
  }
}
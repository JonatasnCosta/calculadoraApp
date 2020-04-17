import 'package:flutter/material.dart';



class TransposicaoAdicao extends StatefulWidget {
  
  @override
  _TransposicaoAdicaoState createState() => _TransposicaoAdicaoState();
}

class _TransposicaoAdicaoState extends State<TransposicaoAdicao> {
   ScrollController _scrollController;
 List allDescriptions =[
    'Preencha os seus pedidos em um clique.',
 ];

  @override
   Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350.0,
          child: ListView(
           padding: EdgeInsets.only(left: 25.0),
           controller: _scrollController,
           scrollDirection: Axis.horizontal,
           children: <Widget>[
            getMenuCard('Agilidade nos seus calculos', 'Saber grau', ' de Adição')
           ]
          )
        ),
         Padding(padding: EdgeInsets.only(top: 10.0, left: 15.0),
        child: Text('O que há de melhor,',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30.0,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        ),
        ),
        Padding(padding: EdgeInsets.only(top: 10.0, left: 15.0),
        child: Text('Para sua ótica!',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30.0,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        ),
        )
      ],
    );
  }
   getMenuCard(
    String price, String menuType, String menuName){
      return Padding(padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 100.0),
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
          color: Color(0xff399d63),
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0
            )
          ]
        ),
         height: 250.0,
        child: Column(
          children: <Widget>[
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              Column(
                children: <Widget>[
                   SizedBox(height: 20.0,),
                    Text(
                         'Agregue',
                         style: TextStyle(
                           fontFamily: 'Montserrat',
                           fontSize: 12.0,
                           fontWeight: FontWeight.w600,
                           color: Color(0xff8ac7a4)
                         ),
                       ),
                   Text(
                         '' + price,
                         style: TextStyle(
                           fontFamily: 'Montserrat',
                           fontSize: 12.0,
                           fontWeight: FontWeight.w600,
                           color: Color(0xff8ac7a4)
                         ),
                       ),
                        SizedBox(height: 80.0,),
                         Text(
                         menuType,
                         style: TextStyle(
                           fontFamily: 'Montserrat',
                           fontSize: 20.0,
                           fontWeight: FontWeight.w400,
                           color: Color(0xff8ac7a4)
                         ),
                       ),
                         Text(
                         menuName,
                         style: TextStyle(
                           fontFamily: 'Montserrat',
                           fontSize: 20.0,
                           fontWeight: FontWeight.w600,
                           color: Color(0xff8ac7a4)
                         ),
                       ),
                   SizedBox(height: 10.0,),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25.0),
                       color: Colors.black
                     ),
                     child: InkWell(
                       onTap: (){
                         //Rota
                       },
                       child: Center(
                         child: Icon(
                           Icons.library_add,
                          color: Colors.white
                        ),
                       ),
                     ),
                   )
                ],
              )
             ],
           )
          ],
        ),
      ),
      );
      
    }

}

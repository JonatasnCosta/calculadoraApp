import 'package:calculadoraapp/Home.dart';
import 'package:calculadoraapp/MenusTransposicao/TransposicaoAdicao.dart';
import 'package:calculadoraapp/MenusTransposicao/TransposicaoCilindrico.dart';
import 'package:calculadoraapp/MenusTransposicao/TransposicaoGraudePerto.dart';
import 'package:flutter/material.dart';




class Transposicao extends StatefulWidget {
  @override
  _TransposicaoState createState() => _TransposicaoState();
}

class _TransposicaoState extends State<Transposicao> with SingleTickerProviderStateMixin
{
 TabController tabController;
 @override
 void initState() {
    
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9efeb),
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
                    Navigator.of(context).pop(MaterialPageRoute(builder:(context) => Home()));
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
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Saber Adição',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                     ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Saber Grau de perto',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                     ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Cilindrico Positivo',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                     ),
                  ),
                )
              ],
              )
            ),
           Container(
             height: MediaQuery.of(context).size.height -200.0,
             child: TabBarView(
               controller: tabController,
                children: <Widget>[
                  TransposicaoAdicao(),
                  TransposicaoGraudePerto(),
                  TransposicaoCilindrico()
                ],
              )
           )  
        ],
      ),
    );
  }
}
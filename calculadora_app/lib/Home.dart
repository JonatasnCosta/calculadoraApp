import 'package:calculadoraapp/MenuVerde.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> 
//Contrutor do Menu
with SingleTickerProviderStateMixin {
  TabController tabController;
  @override 
  void initState(){
    tabController = TabController (vsync: this, length: 3);
    super.initState();
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
                    icon: Icon(Icons.menu), 
                    onPressed: () {}
                  ),
                  FloatingActionButton(
                    onPressed: () {},
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
          // Título
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Kit Óptica',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          //Menu letras
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
                    'Diâmetro de lentes',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                     ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Pedido Laboratório',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                     ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Transposição',
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
           //Menu verde 
           Container(
             height: MediaQuery.of(context).size.height -200.0,
             child: TabBarView(
               controller: tabController,
                children: <Widget>[
                  MenuVerde(),
                  MenuVerde(),
                  MenuVerde()
                ],
              )
           )
        ],
      ),
    );
  }
}

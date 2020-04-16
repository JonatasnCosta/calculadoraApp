import 'package:calculadoraapp/Funcoes/PDFteste.dart';
import 'package:calculadoraapp/Home.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';




class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerAro = TextEditingController();
  TextEditingController _controllerPonte = TextEditingController();
  TextEditingController _controllerMenorDnp = TextEditingController();
  TextEditingController _controllerMaiorDiagonal = TextEditingController();

  String _erro = "";
    
     var
     diametro, 
     aro ,
     ponte ,
     menorDnp ,
     maiorDiagonal;
  
 void _resultadodiametro(BuildContext context){
  double aro = double.tryParse(  _controllerAro.text);
  double ponte = double.tryParse(  _controllerPonte.text);
  double menorDnp = double.tryParse(  _controllerMenorDnp.text);
  double maiorDiagonal = double.tryParse(  _controllerMaiorDiagonal.text);
  

 if (aro == null|| ponte == null || menorDnp == null || maiorDiagonal == null) {
   setState(() {
     _erro = "Use somente o ponto (.) para fazer o calculo. ";
   });
 } 
 else {
 setState(() {
   diametro = (aro + ponte) - (menorDnp * 2) + maiorDiagonal + 2; 
 });
 }
}

 final pdf = pw.Document();
  
  writeOnPdf(){
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
         
         build: (pw.Context context){
          return <pw.Widget>  [
            pw.Header(
              level: 0,
              child: pw.Text("Diâmetro de lentes",
              style: pw.TextStyle(
               fontSize: 40.0,
             )
              ),
            ),
            pw.Row(
              children: [
                pw.Paragraph(
             text: "Diâmetro: ",
             style: pw.TextStyle(
               fontSize: 30.0,
             )
           ),
            pw.Paragraph(text: diametro,
            style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
              ],
            ),
            ];
        },
     )
    );
  }
  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/Diâmetro de lentes.pdf");
    file.writeAsBytesSync(pdf.save());
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
          padding: EdgeInsets.all(14.0),
          child: Text(
            'Calculadora de Diâmetro',
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
                    hintText: 'Aro',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                 controller: _controllerAro,
                ),
              ),
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
                    hintText: 'Ponte',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller:  _controllerPonte,
                ),
              ),
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
                    hintText: 'Menor DNP',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                 controller: _controllerMenorDnp,
                ),
              ),
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
                    hintText: 'Maior diagonal',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                controller: _controllerMaiorDiagonal,
                ),
              ),
            ),
          ),
          Padding( 
            padding: EdgeInsets.only(top: 10.0, left: 70.0, right: 70.0),
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
              _resultadodiametro(context);
              }
            ),
           ),
          Padding(padding: EdgeInsets.only(top: 10.0, left: 70.0, right: 40.0),
          child: Text(_erro,
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
             Padding(padding: EdgeInsets.only( top: 30.0, left: 20.0,bottom: 30.0),
          child: Text("Diâmetro:  $diametro",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
          Padding(padding: EdgeInsets.only(top: 30.0, left: 10.0, bottom: 30.0),
          child: IconButton(
            icon:  Icon(Icons.library_add
            ),
            onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) => Calculadora()));
                },
              ),
             ),
          Padding(padding: EdgeInsets.only(top: 30.0, left: 10.0, bottom: 30.0),
          child: IconButton(
            icon: Icon(Icons.search
            ), 
            onPressed: () async{
              writeOnPdf();
              await savePdf();
             Directory documentDirectory = await getApplicationDocumentsDirectory();
               String documentPath = documentDirectory.path;
               String fullPath = "$documentPath/Diâmetro de lentes.pdf";
               Navigator.push(context, MaterialPageRoute(
            builder: (context) => PDFteste(path: fullPath,)));
            },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30.0, left: 10.0, bottom: 30.0),
          child: IconButton(
            icon:  Icon(Icons.share
            ),
            onPressed: ()async {
            await Printing.sharePdf(bytes: pdf.save(), filename: 'Diâmetro de lentes.pdf');
                },
              ),
             )
            ],
          )
        ],
      ),
    );
    
  }
  
}
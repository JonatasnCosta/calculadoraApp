import 'package:calculadoraapp/Funcoes/OrdemServico.dart';
import 'package:calculadoraapp/Home.dart';
import 'package:calculadoraapp/PdfViews/PdfPreviewScreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class OrdemGerada extends StatelessWidget  {
  final String texonumerocliente;
  final String textonome;
  final String textodata;
  final String textoos;
  final String textonr;
  final String textotipodelente;
  final String textotratamento;
  final String textoodgrau;
  final String textooegrau;
  final String textoadd;
  final String textodnpod;
  final String textodnpoe;
  final String textoaltura;
  final String textodiametro;
  final String textotipodearo;
  final String textoobs;
   // recebendo dados da Tela primária como parâmetro

  OrdemGerada({Key key, @required 
  this.texonumerocliente,
  this.textonome,
   this.textodata,
   this.textoos,
   this.textonr,
   this.textotipodelente,
   this.textotratamento,
   this.textoodgrau,
   this.textooegrau,
   this.textoadd,
   this.textodnpod,
   this.textodnpoe,
   this.textoaltura,
   this.textodiametro,
   this.textotipodearo,
   this.textoobs,
  
  }) : super(key: key);
  //Construtor Telasecundaria
  
  final pdf = pw.Document();
  
  writeOnPdf(){
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a3,
        margin: pw.EdgeInsets.all(32),
        

        build: (pw.Context context){
          return <pw.Widget>  [
            pw.Header(
              level: 0,
              child: pw.Text("Ordem de serviço",
              style: pw.TextStyle(
               fontSize: 40.0,
             )
              ),
            ),
             pw.Row(
              children: [
                pw.Paragraph(
             text: "Número de Cliente: ",
             style: pw.TextStyle(
               fontSize: 30.0,
             )
           ),
            pw.Paragraph(text: texonumerocliente,
            style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
              ]
            ),
             pw.Row(
              children: [
                pw.Paragraph(
             text: "Ótica: ",
             style: pw.TextStyle(
               fontSize: 30.0,
             )
           ),
            pw.Paragraph(text: textonome,
            style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
              ]
            ),
            pw.Row(
              children: [
                 pw.Paragraph(
                text: "Data: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
            pw.Paragraph(text: textodata,
            style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
            ]
            ),
             pw.Row(
              children: [
                pw.Paragraph(
                text: "Número O.S: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textoos,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
             ]
            ),
            pw.Row(
              children: [
                pw.Paragraph(
                text: "Número da NR: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textonr,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
             ]
            ), pw.Row(
              children: [
                pw.Paragraph(
                text: "Tipo de lente: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textotipodelente,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
              ]
            ), pw.Row(
              children: [
                pw.Paragraph(
                text: "Tratamento: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textotratamento,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ), 
              ]
            ),
             pw.Row(
              children: [
                pw.Paragraph(
                text: "OD: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textoodgrau,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
                
              ]
            ),
             pw.Row(
              children: [
                 pw.Paragraph(
                text: "OE: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textooegrau,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
              ]
            ),
             pw.Row(
              children: [
                pw.Paragraph(
                text: "Adição: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
            pw.Paragraph(text: textoadd,
            style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
              ]
            ),
             pw.Row(
              children: [
                pw.Paragraph(
                text: "DNP OD: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textodnpod,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
              ]
            ),
             pw.Row(
              children: [
                 pw.Paragraph(
                text: "DNP OE: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textodnpoe,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
              ]
            ),
             pw.Row(
              children: [
                 pw.Paragraph(
                text: "Altura: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textoaltura,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
              ]
            ),
             pw.Row(
              children: [
                 pw.Paragraph(
                text: "Diâmetro: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textodiametro,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
              ]
            ),
             pw.Row(
              children: [
                 pw.Paragraph(
                text: "Tipo de aro: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: textotipodearo,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
              ]
            ),
              pw.Paragraph(
                text: "Observações:",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text:textoobs,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
          ];
        },
     )
    );
  }
   Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/Pedido O.S: $textoos.pdf");
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
                    Navigator.of(context).pop();
                  }
                ),
                FloatingActionButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
            'Ordem Gerada',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding( 
            padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Visualizar Ordem de serviço'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: () async{
                writeOnPdf();
              await savePdf();
             Directory documentDirectory = await getApplicationDocumentsDirectory();
               String documentPath = documentDirectory.path;
               String fullPath = "$documentPath/Pedido O.S: $textoos.pdf";
               Navigator.push(context, MaterialPageRoute(
            builder: (context) => PdfPreviewScreen(path: fullPath,)));
              },
            ),
          ),
          Padding( 
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Compartilhar Ordem de serviço'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: () async{
                await Printing.sharePdf(bytes: pdf.save(), filename: 'Pedido O.S: $textoos.pdf');
              },
            ),
          ),
          Padding( 
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Novo pedido'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => OrdemServico()));
              },
            ),
          ),
        ],
      ),
    );
  }

  
}
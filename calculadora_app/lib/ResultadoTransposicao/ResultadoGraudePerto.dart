import 'package:calculadoraapp/Home.dart';
import 'package:calculadoraapp/SubFuncaoTransposicao/FuncaoGraudePerto.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:calculadoraapp/PdfViews/PDFDiametro.dart';
import 'package:intl/intl.dart';

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
TextEditingController _controllerNumeroCliente = TextEditingController(); 
TextEditingController _controllerNomeotica = TextEditingController();
TextEditingController _controllerData = TextEditingController();
TextEditingController _controllerOS = TextEditingController();
TextEditingController _controllerTipodelente = TextEditingController();
TextEditingController _controllerTratamento = TextEditingController();
TextEditingController _controllerDNPOD = TextEditingController();
TextEditingController _controllerDNPOE = TextEditingController();
TextEditingController _controllerDiametro = TextEditingController();
TextEditingController _controllerTipodearo = TextEditingController();
TextEditingController _controllerObservacoes = TextEditingController();
NumberFormat nf = NumberFormat("0.00");
NumberFormat fn = NumberFormat("0");

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
            pw.Paragraph(text: _controllerNumeroCliente.text,
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
            pw.Paragraph(text: _controllerNomeotica.text,
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
            pw.Paragraph(text: _controllerData.text,
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
             pw.Paragraph(text: _controllerOS.text,
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
             pw.Paragraph(text: _controllerTipodelente.text,
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
             pw.Paragraph(text: _controllerTratamento.text,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ), 
              ]
            ),
             pw.Row(
              children: [
              widget.graudePertoOD > 0 ? 
              pw.Container(
                child: pw.Row(children: [
                   pw.Paragraph(
                text: "OD: +",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(
                text: nf.format(widget.graudePertoOD),
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
                ]
              )
            ): 
            pw.Container(
              child: pw.Row(children: [
               pw.Paragraph(
                text: "OD  ",
                 style: pw.TextStyle(
               fontSize: 30.0,
               )
              ),
              pw.Paragraph(
                text: nf.format(widget.graudePertoOD),
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            )
              ]
             )
            ),
            pw.Padding(padding: pw.EdgeInsets.only(left: 20.0),
            child:  pw.Container(
              child: pw.Row(children: [
               pw.Paragraph(
                text: "Cil  ",
                 style: pw.TextStyle(
               fontSize: 30.0,
               )
              ),
              pw.Paragraph(
                text: nf.format(widget.cilOD),
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            )
              ]
             )
            ),
            ),
            pw.Padding(padding: pw.EdgeInsets.only(left: 20.0),
            child:  pw.Container(
              child: pw.Row(children: [
               pw.Paragraph(
                text: "Eixo  ",
                 style: pw.TextStyle(
               fontSize: 30.0,
               )
              ),
              pw.Paragraph(
                text: fn.format(widget.eixoOD),
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            )
              ]
             )
            ),
            ),
            ]
            ),
              pw.Row(
              children: [
              widget.graudePertoOE > 0 ? 
              pw.Container(
                child: pw.Row(children: [
                   pw.Paragraph(
                text: "OE: +",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(
                text: nf.format(widget.graudePertoOE),
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
                ]
              )
            ): 
            pw.Container(
              child: pw.Row(children: [
               pw.Paragraph(
                text: "OE  ",
                 style: pw.TextStyle(
               fontSize: 30.0,
               )
              ),
              pw.Paragraph(
                text: nf.format(widget.graudePertoOE),
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            )
              ]
             )
            ),
            pw.Padding(padding: pw.EdgeInsets.only(left: 20.0),
            child:  pw.Container(
              child: pw.Row(children: [
               pw.Paragraph(
                text: "Cil  ",
                 style: pw.TextStyle(
               fontSize: 30.0,
               )
              ),
              pw.Paragraph(
                text: nf.format(widget.cilOE),
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            )
              ]
             )
            ),
            ),
            pw.Padding(padding: pw.EdgeInsets.only(left: 20.0),
            child:  pw.Container(
              child: pw.Row(children: [
               pw.Paragraph(
                text: "Eixo  ",
                 style: pw.TextStyle(
               fontSize: 30.0,
               )
              ),
              pw.Paragraph(
                text: fn.format(widget.eixoOE),
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            )
              ]
             )
            ),
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
             pw.Paragraph(text: _controllerDNPOD.text,
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
             pw.Paragraph(text: _controllerDNPOE.text,
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
             pw.Paragraph(text: _controllerDiametro.text,
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
             pw.Paragraph(text: _controllerTipodearo.text,
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
             pw.Paragraph(text: _controllerObservacoes.text,
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
    File file = File("$documentPath/Ordem de serviço.pdf");
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
            fontSize: 25.0,
            color: Colors.black),),),
         
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
           children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10.0, left: 20.0),
           child:  widget.graudePertoOD > 0 ? 
           Container(
             child: 
           Row(children: <Widget>[
                   Text('OD: +',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
               ),
               Text(nf.format(widget.graudePertoOD),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
                ),
                ],
                )
             ) : 
          Container(
            child: Row(
                children: <Widget>[
                   Text('OD: ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
               ),
               Text(nf.format(widget.graudePertoOD),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
                ),
                ],
                )
           ),
          ),
           ],
            ),
            Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 5.0),
          child: Text("CIL: ",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           ),
           Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10.0, left: 5.0),
              child: Text(nf.format(widget.cilOD),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
                ),
            )
           ],
           ),
            Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 10.0),
          child: Text("EIXO: ",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 5.0),
          child: Text(fn.format(widget.eixoOD),
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           ),
          ]
          ),
           Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
           children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10.0, left: 20.0),
           child:  widget.graudePertoOE > 0 ? 
           Container(
             child: 
           Row(children: <Widget>[
                   Text('OE: +',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
               ),
               Text(nf.format(widget.graudePertoOE),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
                ),
                ],
                )
             ) : 
          Container(
            child: Row(
                children: <Widget>[
                   Text('OE: ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
               ),
               Text(nf.format(widget.graudePertoOE),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
                ),
                ],
                )
           ),
          ),
           ],
            ),
            Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 5.0),
          child: Text("CIL: ",
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           ),
           Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10.0, left: 5.0),
              child: Text(nf.format(widget.cilOE),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
                ),
                ),
            )
           ],
           ),
            Row(
             children: <Widget>[
                Padding(padding: EdgeInsets.only( top: 10.0, left: 10.0),
          child: Text("EIXO: ",
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
                Padding(padding: EdgeInsets.only( top: 10.0, left: 5.0),
          child: Text(fn.format(widget.eixoOE),
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 20.0,
            color: Colors.black
          ),
          ),
          ),
             ],
           ),
          ]
          ),
         
           Padding(padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 40.0),
          child: Text('Gerar ordem de serviço:',
          style: TextStyle(
            fontFamily:  'Montserrat',
            fontSize: 25.0,
            color: Colors.black),
            ),
            ),
            Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Número de cliente ',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerNumeroCliente,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
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
                    hintText: 'Ótica ',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerNomeotica,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Data',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerData,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Número O.S',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerOS,
                ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
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
                    hintText: 'Tipo de Lente',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerTipodelente,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
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
                    hintText: 'Tratamento',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerTratamento,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
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
                    hintText: 'DNP: OD',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerDNPOD,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
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
                    hintText: 'DNP: OE',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerDNPOE,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                   keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Diâmetro',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerDiametro,
                )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
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
                    hintText: 'Tipo de aro',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerTipodearo,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 20.0),
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
                    hintText: 'Observações',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                   controller: _controllerObservacoes,
                ),
              ),
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
               String fullPath = "$documentPath/Ordem de serviço.pdf";
               Navigator.push(context, MaterialPageRoute(
            builder: (context) => PDFDiametro(path: fullPath,)));
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
                 await Printing.sharePdf(bytes: pdf.save(), filename:'Ordem de serviço.pdf');
              },
            ),
          ),
          Padding( 
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 50.0),
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
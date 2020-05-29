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
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = '721A33913C7D7D311A5FB39652B0084B';

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

static const  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Mortgage', 'Attorney'],
  );
 
   BannerAd _bannerAd;
   BannerAd createBannerAd(){
    return BannerAd(
    adUnitId:'ca-app-pub-7677202089790115/3031795472', 
    size: AdSize.smartBanner,
     targetingInfo: targetingInfo,
     listener: (MobileAdEvent event) {
    print("BannerAd $event");
     });
 }
 @override
 void initState(){
 FirebaseAdMob.instance.initialize(appId:'ca-app-pub-7677202089790115~7992122892');
 _bannerAd = createBannerAd()
 ..load()
 ..show();
  super.initState();
 }

 @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

TextEditingController _controllerNumeroCliente = TextEditingController(); 
TextEditingController _controllerNomeotica = TextEditingController();
TextEditingController _controllerData = TextEditingController();
TextEditingController _controllerOS = TextEditingController();
TextEditingController _controllerNR = TextEditingController();
TextEditingController _controllerTipodelente = TextEditingController();
TextEditingController _controllerTratamento = TextEditingController();
TextEditingController _controllerDNPOD = TextEditingController();
TextEditingController _controllerDNPOE = TextEditingController();
TextEditingController _controllerDiametro = TextEditingController();
TextEditingController _controllerTipodearo = TextEditingController();
TextEditingController _controllerObservacoes = TextEditingController();
var maskFormatter = new MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') }); 
var maskFormatterDNPOD = new MaskTextInputFormatter(mask: '##.#', filter: { "#": RegExp(r'[0-9]') });
var maskFormatterDNPOE = new MaskTextInputFormatter(mask: '##.#', filter: { "#": RegExp(r'[0-9]') });
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
            ),
             pw.Row(
              children: [
                pw.Paragraph(
                text: "Número da NR: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: _controllerNR.text,
             style: pw.TextStyle(
               fontSize: 30.0,
             )
             ),
             ]
            ),
             pw.Row(
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
                    Navigator.of(context).pop();
                  }
                ),
                FloatingActionButton(
                  onPressed: () {
                     Navigator.pop(context, MaterialPageRoute(builder: (context) => Home()));
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    labelText: 'Número de cliente ',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    labelText: 'Ótica ',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff399d63)
              ),
              child: Center(
                child: TextField(
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Data',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    labelText: 'Número O.S',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    labelText: 'Número da NR',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerNR
                ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    labelText: 'Tipo de Lente',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    labelText: 'Tratamento',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    inputFormatters: [maskFormatterDNPOD],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'DNP: OD',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    inputFormatters: [maskFormatterDNPOE],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'DNP: OE',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    labelText: 'Diâmetro',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
                    labelText: 'Tipo de aro',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0, bottom: 20.0),
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
                    labelText: 'Observações',
                    labelStyle: TextStyle(
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
            padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 30.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Gerar Ordem de serviço'),
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
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
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0, bottom: 60.0),
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
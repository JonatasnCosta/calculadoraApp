import 'package:calculadoraapp/DiametroComparti.dart';
import 'package:calculadoraapp/Home.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:calculadoraapp/PdfViews/PdfPreviewScreen.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const String testDevice = '721A33913C7D7D311A5FB39652B0084B';



class OrdemServico extends StatefulWidget {
  @override
  _OrdemServicoState createState() => _OrdemServicoState();
}


class _OrdemServicoState extends State<OrdemServico> {

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
TextEditingController _controllerODGrau = TextEditingController();
TextEditingController _controllerOEGrau = TextEditingController();
TextEditingController _controllerADD = TextEditingController();
TextEditingController _controllerDNPOD = TextEditingController();
TextEditingController _controllerDNPOE = TextEditingController();
TextEditingController _controllerAltura = TextEditingController();
TextEditingController _controllerDiametro = TextEditingController();
TextEditingController _controllerTipodearo = TextEditingController();
TextEditingController _controllerObservacoes = TextEditingController();
var maskFormatter = new MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') }); 
var maskFormatterAdicao = new MaskTextInputFormatter(mask: '#.##', filter: { "#": RegExp(r'[0-9]') }); 
var maskFormatterDNPOD = new MaskTextInputFormatter(mask: '##.#', filter: { "#": RegExp(r'[0-9]') }); 
var maskFormatterDNPOE = new MaskTextInputFormatter(mask: '##.#', filter: { "#": RegExp(r'[0-9]') }); 
var maskFormatterAltura = new MaskTextInputFormatter(mask: '##', filter: { "#": RegExp(r'[0-9]') });
var maskFormatterDiametro = new MaskTextInputFormatter(mask: '##', filter: { "#": RegExp(r'[0-9]') });

bool _isButtonDisabled = true;

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
                pw.Paragraph(
                text: "OD: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: _controllerODGrau.text,
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
             pw.Paragraph(text: _controllerOEGrau.text,
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
            pw.Paragraph(text: _controllerADD.text,
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
                text: "Altura: ",
                style: pw.TextStyle(
               fontSize: 30.0,
             )
            ),
             pw.Paragraph(text: _controllerAltura.text,
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
            'Ordem de serviço',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40.0,
                fontWeight: FontWeight.w500),
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
                   inputFormatters: [maskFormatter],
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
                    labelText: 'OD:     Esf     Cil      Eixo',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerODGrau,
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
                    labelText: 'OE:     Esf     Cil      Eixo',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerOEGrau,
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
                    inputFormatters: [maskFormatterAdicao],
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
                   inputFormatters: [maskFormatterAltura],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Altura',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                  controller: _controllerAltura,
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
                    inputFormatters: [maskFormatterDiametro],
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
              child: Text(_isButtonDisabled ? 'Gerar Ordem de serviço' : 'Ordem de serviço gerada'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: _alternaButton 
            ),
          ),
            Padding( 
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Calcular Diâmetro da lente'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder:(context) => DimetroComparti()));
              }
            ),
           ),
           Padding( 
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 30.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Compartilhar Ordem de serviço'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed:  _isButtonDisabled ? null : () async{
                await Printing.sharePdf(bytes: pdf.save(), filename:'Ordem de serviço.pdf');
                  writeOnPdf();
              }
            ),
          ),
           Padding( 
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 30.0, bottom: 60.0),
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
               Navigator.of(context).push(MaterialPageRoute(builder:(context) => OrdemServico()));
              }
            ),
           ),
          
        ],
      ),
  );

  }
  
     _alternaButton() {
      setState(() => _isButtonDisabled = !_isButtonDisabled);
      setState(() async{
                writeOnPdf();
              await savePdf();
               Directory documentDirectory = await getApplicationDocumentsDirectory();
               String documentPath = documentDirectory.path;
               String fullPath = "$documentPath/Ordem de serviço.pdf";
               Navigator.push(context, MaterialPageRoute(
            builder: (context) => PdfPreviewScreen(path: fullPath,)));
              }
      );
      
   }     
  
}



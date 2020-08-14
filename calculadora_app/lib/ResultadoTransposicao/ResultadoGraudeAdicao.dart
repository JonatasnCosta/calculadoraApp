import 'package:calculadoraapp/DiametroComparti.dart';
import 'package:calculadoraapp/Home.dart';
import 'package:calculadoraapp/SubFuncaoTransposicao/FuncaoAdicao.dart';
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

const String testDevice = '9A88AAC62836EFF2EF922D024CB9D9BE';

class ResultadoGraudeAdicao extends StatefulWidget {
  final double adicaoFinal;
  final double cilOD;
  final double eixoOD;
  final double cilOE;
  final double eixoOE;
  final double valorOD;
  final double valorOE;

  ResultadoGraudeAdicao({
    Key key,
    @required this.cilOD,
    this.eixoOD,
    this.cilOE,
    this.eixoOE,
    this.valorOD,
    this.valorOE,
    this.adicaoFinal,
  }) : super(key: key);

  @override
  _ResultadoGraudeAdicaoState createState() => _ResultadoGraudeAdicaoState();
}

class _ResultadoGraudeAdicaoState extends State<ResultadoGraudeAdicao> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Mortgage', 'Attorney'],
  );

  BannerAd _bannerAd;
  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-7677202089790115/3031795472',
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-7677202089790115~7992122892');
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
  TextEditingController _controllerDP = TextEditingController();
  TextEditingController _controllerDNPOD = TextEditingController();
  TextEditingController _controllerDNPOE = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  TextEditingController _controllerRefArmacao = TextEditingController();
  TextEditingController _controllerObservacoes = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterDP =
      new MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterDNPOD =
      new MaskTextInputFormatter(mask: '##.#', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterDNPOE =
      new MaskTextInputFormatter(mask: '##.#', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterAltura =
      new MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterDiametro =
      new MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});
  var _currencies = [
    '  Tipo',
    'Zilo aro total',
    'Zilo com nylon',
    'Metal aro total',
    'Metal com nylon',
    'Nylon',
    'Balgriff'
  ];
  var _currentItemSelected = '  Tipo';
  var _diametro = [
    '  0',
    '5',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '51',
    '60',
    '65',
    '70',
    '75',
    '80',
    '85',
    '90',
    '95',
    '100'
  ];
  var _currentItemSelectedDIAMETRO = '  0';

  NumberFormat nf = NumberFormat("0.00");
  NumberFormat fn = NumberFormat("0");
  bool _isButtonDisabled = true;
  String os = '';

  final pdf = pw.Document();

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a3,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
            level: 0,
            child: pw.Text("Ordem de serviço",
                style: pw.TextStyle(
                  fontSize: 40.0,
                )),
          ),
          pw.Row(children: [
            pw.Paragraph(
                text: "Número de Cliente: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerNumeroCliente.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Ótica: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerNomeotica.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Número O.S: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerOS.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Número da NR: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerNR.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Data: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerData.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Tipo de lente: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerTipodelente.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Tratamento: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerTratamento.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            widget.valorOD > 0
                ? pw.Container(
                    child: pw.Row(children: [
                    pw.Paragraph(
                        text: "OD: +",
                        style: pw.TextStyle(
                          fontSize: 30.0,
                        )),
                    pw.Paragraph(
                        text: nf.format(widget.valorOD),
                        style: pw.TextStyle(
                          fontSize: 30.0,
                        )),
                  ]))
                : pw.Container(
                    child: pw.Row(children: [
                    pw.Paragraph(
                        text: "OD  ",
                        style: pw.TextStyle(
                          fontSize: 30.0,
                        )),
                    pw.Paragraph(
                        text: nf.format(widget.valorOD),
                        style: pw.TextStyle(
                          fontSize: 30.0,
                        ))
                  ])),
            pw.Padding(
              padding: pw.EdgeInsets.only(left: 20.0),
              child: pw.Container(
                  child: pw.Row(children: [
                pw.Paragraph(
                    text: "Cil  ",
                    style: pw.TextStyle(
                      fontSize: 30.0,
                    )),
                pw.Paragraph(
                    text: nf.format(widget.cilOD),
                    style: pw.TextStyle(
                      fontSize: 30.0,
                    ))
              ])),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.only(left: 20.0),
              child: pw.Container(
                  child: pw.Row(children: [
                pw.Paragraph(
                    text: "Eixo  ",
                    style: pw.TextStyle(
                      fontSize: 30.0,
                    )),
                pw.Paragraph(
                    text: fn.format(widget.eixoOD),
                    style: pw.TextStyle(
                      fontSize: 30.0,
                    ))
              ])),
            ),
          ]),
          pw.Row(children: [
            widget.valorOE > 0
                ? pw.Container(
                    child: pw.Row(children: [
                    pw.Paragraph(
                        text: "OE: +",
                        style: pw.TextStyle(
                          fontSize: 30.0,
                        )),
                    pw.Paragraph(
                        text: nf.format(widget.valorOE),
                        style: pw.TextStyle(
                          fontSize: 30.0,
                        )),
                  ]))
                : pw.Container(
                    child: pw.Row(children: [
                    pw.Paragraph(
                        text: "OE  ",
                        style: pw.TextStyle(
                          fontSize: 30.0,
                        )),
                    pw.Paragraph(
                        text: nf.format(widget.valorOE),
                        style: pw.TextStyle(
                          fontSize: 30.0,
                        ))
                  ])),
            pw.Padding(
              padding: pw.EdgeInsets.only(left: 20.0),
              child: pw.Container(
                  child: pw.Row(children: [
                pw.Paragraph(
                    text: "Cil  ",
                    style: pw.TextStyle(
                      fontSize: 30.0,
                    )),
                pw.Paragraph(
                    text: nf.format(widget.cilOE),
                    style: pw.TextStyle(
                      fontSize: 30.0,
                    ))
              ])),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.only(left: 20.0),
              child: pw.Container(
                  child: pw.Row(children: [
                pw.Paragraph(
                    text: "Eixo  ",
                    style: pw.TextStyle(
                      fontSize: 30.0,
                    )),
                pw.Paragraph(
                    text: fn.format(widget.eixoOE),
                    style: pw.TextStyle(
                      fontSize: 30.0,
                    ))
              ])),
            ),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Adição: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: nf.format(widget.adicaoFinal),
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "DP: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerDP.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "DNP OD: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerDNPOD.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "DNP OE: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerDNPOE.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Altura: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerAltura.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Diâmetro: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: '$_currentItemSelectedDIAMETRO',
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Tipo de aro: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: '$_currentItemSelected',
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Row(children: [
            pw.Paragraph(
                text: "Referência da armação: ",
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
            pw.Paragraph(
                text: _controllerRefArmacao.text,
                style: pw.TextStyle(
                  fontSize: 30.0,
                )),
          ]),
          pw.Paragraph(
              text: "Observações:",
              style: pw.TextStyle(
                fontSize: 30.0,
              )),
          pw.Paragraph(
              text: _controllerObservacoes.text,
              style: pw.TextStyle(
                fontSize: 30.0,
              )),
        ];
      },
    ));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/OS:$os.pdf");
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
                      }),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    mini: true,
                    elevation: 0.0,
                    child:
                        Icon(Icons.short_text, color: Colors.black, size: 17.0),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Resultado grau do Multifocal',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 40.0),
            child: Text(
              'Grau para multifocal:',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  color: Colors.black),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20.0),
                  child: widget.valorOD > 0
                      ? Container(
                          child: Row(
                          children: <Widget>[
                            Text(
                              'OD: +',
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 20.0),
                            ),
                            Text(
                              nf.format(widget.valorOD),
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 20.0),
                            ),
                          ],
                        ))
                      : Container(
                          child: Row(
                          children: <Widget>[
                            Text(
                              'OD: ',
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 20.0),
                            ),
                            Text(
                              nf.format(widget.valorOD),
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 20.0),
                            ),
                          ],
                        )),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 5.0),
                  child: Text(
                    "CIL: ",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 5.0),
                  child: Text(
                    nf.format(widget.cilOD),
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(
                    "EIXO: ",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 5.0),
                  child: Text(
                    fn.format(widget.eixoOD),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0),
                    child: widget.valorOE > 0
                        ? Container(
                            child: Row(
                            children: <Widget>[
                              Text(
                                'OE: +',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 20.0),
                              ),
                              Text(
                                nf.format(widget.valorOE),
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 20.0),
                              ),
                            ],
                          ))
                        : Container(
                            child: Row(
                            children: <Widget>[
                              Text(
                                'OE: ',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 20.0),
                              ),
                              Text(
                                nf.format(widget.valorOE),
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 20.0),
                              ),
                            ],
                          )),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 5.0),
                    child: Text(
                      "CIL: ",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 5.0),
                    child: Text(
                      nf.format(widget.cilOE),
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text(
                      "EIXO: ",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 5.0),
                    child: Text(
                      fn.format(widget.eixoOE),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Adição  ',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                      ),
                      Text(
                        nf.format(widget.adicaoFinal),
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                      ),
                    ],
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 40.0),
            child: Text(
              'Gerar ordem de serviço:',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25.0,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Número de cliente ',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerNumeroCliente,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Ótica ',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerNomeotica,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Número O.S',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerOS,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Número da NR',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.black),
                    ),
                    controller: _controllerNR),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
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
                        color: Colors.black),
                  ),
                  controller: _controllerData,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Tipo de Lente',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerTipodelente,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Tratamento',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerTratamento,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterDP],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'DP',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerDP,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
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
                        color: Colors.black),
                  ),
                  controller: _controllerDNPOD,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
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
                        color: Colors.black),
                  ),
                  controller: _controllerDNPOE,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
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
                        color: Colors.black),
                  ),
                  controller: _controllerAltura,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      'Diâmetro',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      ':',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    DropdownButton<String>(
                      items: _diametro.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelecteddiametro) {
                        setState(() {
                          this._currentItemSelectedDIAMETRO =
                              newValueSelecteddiametro;
                        });
                      },
                      value: _currentItemSelectedDIAMETRO,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 37.0, right: 1.0),
                      child: RaisedButton(
                          color: Color(0xff399d63),
                          textColor: Colors.black,
                          padding: EdgeInsets.all(15.0),
                          child: Text('Calcular Diâmetro'),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.black)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DimetroComparti()));
                          }),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      'Tipo de aro',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      ':',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    DropdownButton<String>(
                      items: _currencies.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentItemSelected = newValueSelected;
                        });
                      },
                      value: _currentItemSelected,
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Referência da armação',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.black),
                    ),
                    controller: _controllerRefArmacao),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 20.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Observações',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerObservacoes,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: RaisedButton(
                color: Color(0xff399d63),
                textColor: Colors.black,
                padding: EdgeInsets.all(15.0),
                child: Text(_isButtonDisabled
                    ? 'Gerar Ordem de serviço'
                    : 'Ordem de serviço gerada'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: _alternaButton),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: RaisedButton(
                color: Color(0xff399d63),
                textColor: Colors.black,
                padding: EdgeInsets.all(15.0),
                child: Text('Compartilhar Ordem de serviço'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: _isButtonDisabled
                    ? null
                    : () async {
                        await Printing.sharePdf(
                            bytes: pdf.save(), filename: 'OS:$os.pdf');
                        writeOnPdf();
                      }),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, left: 5.0, right: 5.0, bottom: 200.0),
            child: RaisedButton(
                color: Color(0xff399d63),
                textColor: Colors.black,
                padding: EdgeInsets.all(15.0),
                child: Text('Gerar novo calculo de adição'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: _isButtonDisabled
                    ? null
                    : () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FuncaoAdicao()));
                      }),
          ),
        ],
      ),
    );
  }

  void _converter() {
    os = (_controllerOS.text);
  }

  _alternaButton() {
    setState(() {
      _converter();
    });
    setState(() => _isButtonDisabled = !_isButtonDisabled);
    setState(() async {
      writeOnPdf();
      await savePdf();
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      String fullPath = "$documentPath/OS:$os.pdf";
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PDFDiametro(
                    path: fullPath,
                  )));
    });
  }
}

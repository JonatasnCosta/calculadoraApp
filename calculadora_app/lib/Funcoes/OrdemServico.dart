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

const String testDevice = 'Mobile_id';

class OrdemServico extends StatefulWidget {
  @override
  _OrdemServicoState createState() => _OrdemServicoState();
}

class _OrdemServicoState extends State<OrdemServico> {
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
  var maskFormatterAdicao =
      new MaskTextInputFormatter(mask: '#.##', filter: {"#": RegExp(r'[0-9]')});
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

  var _od = [
    '  0.00',
    '+0.25',
    '-0.25',
    '+0.50',
    '-0.50',
    '+0.75',
    '-0.75',
    '+1.00',
    '-1.00',
    '+1.25',
    '-1.25',
    '+1.50',
    '-1.50',
    '+1.75',
    '-1.75',
    '+2.00',
    '-2.00',
    '+2.25',
    '-2.25',
    '+2.50',
    '-2.50',
    '+2.75',
    '-2.75',
    '+3.00',
    '-3.00',
    '+3.25',
    '-3.25',
    '+3.50',
    '-3.50',
    '+3.75',
    '-3.75',
    '+4.00',
    '-4.00',
    '+4.25',
    '-4.25',
    '+4.50',
    '-4.50',
    '+4.75',
    '-4.75',
    '+5.00',
    '-5.00',
    '+5.25',
    '-5.25',
    '+5.50',
    '-5.50',
    '+5.75',
    '-5.75',
    '+6.00',
    '-6.00',
    '+6.25',
    '-6.25',
    '+6.50',
    '-6.50',
    '+6.75',
    '-6.75',
    '+7.00',
    '-7.00',
    '+7.25',
    '-7.25',
    '+7.50',
    '-7.50',
    '+7.75',
    '-7.75',
    '+8.00',
    '-8.00',
    '+8.25',
    '-8.25',
    '+8.50',
    '-8.50',
    '+8.75',
    '-8.75',
    '+9.00',
    '-9.00',
    '+9.25',
    '-9.25',
    '+9.50',
    '-9.50',
    '+9.75',
    '-9.75',
    '+10.00',
    '-10.00',
    '+10.25',
    '-10.25',
    '+10.50',
    '-10.50',
    '+10.75',
    '-10.75',
    '+11.00',
    '-11.00',
    '+11.25',
    '-11.25',
    '+11.50',
    '-11.50',
    '+11.75',
    '-11.75',
    '+12.00',
    '-12.00',
    '+12.25',
    '-12.25',
    '+12.50',
    '-12.50',
    '+12.75',
    '-12.75',
    '+13.00',
    '-13.00',
    '+13.25',
    '-13.25',
    '+13.50',
    '-13.50',
    '+13.75',
    '-13.75',
    '+14.00',
    '-14.00',
    '+14.25',
    '-14.25',
    '+14.50',
    '-14.50',
    '+14.75',
    '-14.75',
    '+15.00',
    '-15.00',
    '+15.25',
    '-15.25',
    '+15.50',
    '-15.50',
    '+15.75',
    '-15.75',
    '+16.00',
    '-16.00',
    '+16.25',
    '-16.25',
    '+16.50',
    '-16.50',
    '+16.75',
    '-16.75',
    '+17.00',
    '-17.00',
    '+17.25',
    '-17.25',
    '+17.50',
    '-17.50',
    '+17.75',
    '-17.75',
    '+18.00',
    '-18.00',
    '+18.25',
    '-18.25',
    '+18.50',
    '-18.50',
    '+18.75',
    '-18.75',
    '+19.00',
    '-19.00',
    '+19.25',
    '-19.25',
    '+19.50',
    '-19.50',
    '+19.75',
    '-19.75',
    '+20.00',
    '-20.00',
    '+20.25',
    '-20.25',
    '+20.50',
    '-20.50',
    '+20.75',
    '-20.75',
    '+21.00',
    '-21.00',
    '+21.25',
    '-21.25',
    '+21.50',
    '-21.50',
    '+21.75',
    '-21.75',
    '+22.00',
    '-22.00',
    '+22.25',
    '-22.25',
    '+22.50',
    '-22.50',
    '+22.75',
    '-22.75',
    '+23.00',
    '-23.00',
    '+23.25',
    '-23.25',
    '+23.50',
    '-23.50',
    '+23.75',
    '-23.75',
    '+24.00',
    '-24.00',
    '+24.25',
    '-24.25',
    '+24.50',
    '-24.50',
    '+24.75',
    '-24.75',
    '+25.00',
    '-25.00',
  ];

  var _currentItemSelectedOD = '  0.00';

  var _cilod = [
    '  0.00',
    '-0.25',
    '-0.50',
    '-0.75',
    '-1.00',
    '-1.25',
    '-1.50',
    '-1.75',
    '-2.00',
    '-2.25',
    '-2.50',
    '-2.75',
    '-3.00',
    '-3.25',
    '-3.50',
    '-3.75',
    '-4.00',
    '-4.25',
    '-4.50',
    '-4.75',
    '-5.00',
    '-5.25',
    '-5.50',
    '-5.75',
    '-6.00',
    '-6.25',
    '-6.50',
    '-6.75',
    '-7.00',
    '-7.25',
    '-7.50',
    '-7.75',
    '-8.00',
    '-8.25',
    '-8.50',
    '-8.75',
    '-9.00',
    '-10.25',
    '-10.50',
    '-10.75',
    '-11.00',
    '-11.25',
    '-11.50',
    '-11.75',
    '-12.00',
    '-12.25',
    '-12.50',
    '-12.75',
    '-13.00',
    '-13.25',
    '-13.50',
    '-13.75',
    '-14.00',
    '-14.25',
    '-14.50',
    '-14.75',
    '-15.00',
    '-15.25',
    '-15.50',
    '-15.75',
    '-16.00',
    '-17.25',
    '-17.50',
    '-17.75',
    '-18.00',
    '-18.25',
    '-18.50',
    '-18.75',
    '-19.00',
    '-19.25',
    '-19.50',
    '-19.75',
    '-20.00',
  ];
  var _currentItemSelectedCILOD = '  0.00';

  var _eixood = [
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
    '55',
    '60',
    '65',
    '70',
    '75',
    '80',
    '85',
    '90',
    '95',
    '100',
    '105',
    '110',
    '115',
    '120',
    '125',
    '130',
    '135',
    '140',
    '145',
    '150',
    '155',
    '160',
    '165',
    '170',
    '175',
    '180'
  ];
  var _currentItemSelectedEIXOOD = '  0';

  var _oe = [
    '  0.00',
    '+0.25',
    '-0.25',
    '+0.50',
    '-0.50',
    '+0.75',
    '-0.75',
    '+1.00',
    '-1.00',
    '+1.25',
    '-1.25',
    '+1.50',
    '-1.50',
    '+1.75',
    '-1.75',
    '+2.00',
    '-2.00',
    '+2.25',
    '-2.25',
    '+2.50',
    '-2.50',
    '+2.75',
    '-2.75',
    '+3.00',
    '-3.00',
    '+3.25',
    '-3.25',
    '+3.50',
    '-3.50',
    '+3.75',
    '-3.75',
    '+4.00',
    '-4.00',
    '+4.25',
    '-4.25',
    '+4.50',
    '-4.50',
    '+4.75',
    '-4.75',
    '+5.00',
    '-5.00',
    '+5.25',
    '-5.25',
    '+5.50',
    '-5.50',
    '+5.75',
    '-5.75',
    '+6.00',
    '-6.00',
    '+6.25',
    '-6.25',
    '+6.50',
    '-6.50',
    '+6.75',
    '-6.75',
    '+7.00',
    '-7.00',
    '+7.25',
    '-7.25',
    '+7.50',
    '-7.50',
    '+7.75',
    '-7.75',
    '+8.00',
    '-8.00',
    '+8.25',
    '-8.25',
    '+8.50',
    '-8.50',
    '+8.75',
    '-8.75',
    '+9.00',
    '-9.00',
    '+9.25',
    '-9.25',
    '+9.50',
    '-9.50',
    '+9.75',
    '-9.75',
    '+10.00',
    '-10.00',
    '+10.25',
    '-10.25',
    '+10.50',
    '-10.50',
    '+10.75',
    '-10.75',
    '+11.00',
    '-11.00',
    '+11.25',
    '-11.25',
    '+11.50',
    '-11.50',
    '+11.75',
    '-11.75',
    '+12.00',
    '-12.00',
    '+12.25',
    '-12.25',
    '+12.50',
    '-12.50',
    '+12.75',
    '-12.75',
    '+13.00',
    '-13.00',
    '+13.25',
    '-13.25',
    '+13.50',
    '-13.50',
    '+13.75',
    '-13.75',
    '+14.00',
    '-14.00',
    '+14.25',
    '-14.25',
    '+14.50',
    '-14.50',
    '+14.75',
    '-14.75',
    '+15.00',
    '-15.00',
    '+15.25',
    '-15.25',
    '+15.50',
    '-15.50',
    '+15.75',
    '-15.75',
    '+16.00',
    '-16.00',
    '+16.25',
    '-16.25',
    '+16.50',
    '-16.50',
    '+16.75',
    '-16.75',
    '+17.00',
    '-17.00',
    '+17.25',
    '-17.25',
    '+17.50',
    '-17.50',
    '+17.75',
    '-17.75',
    '+18.00',
    '-18.00',
    '+18.25',
    '-18.25',
    '+18.50',
    '-18.50',
    '+18.75',
    '-18.75',
    '+19.00',
    '-19.00',
    '+19.25',
    '-19.25',
    '+19.50',
    '-19.50',
    '+19.75',
    '-19.75',
    '+20.00',
    '-20.00',
    '+20.25',
    '-20.25',
    '+20.50',
    '-20.50',
    '+20.75',
    '-20.75',
    '+21.00',
    '-21.00',
    '+21.25',
    '-21.25',
    '+21.50',
    '-21.50',
    '+21.75',
    '-21.75',
    '+22.00',
    '-22.00',
    '+22.25',
    '-22.25',
    '+22.50',
    '-22.50',
    '+22.75',
    '-22.75',
    '+23.00',
    '-23.00',
    '+23.25',
    '-23.25',
    '+23.50',
    '-23.50',
    '+23.75',
    '-23.75',
    '+24.00',
    '-24.00',
    '+24.25',
    '-24.25',
    '+24.50',
    '-24.50',
    '+24.75',
    '-24.75',
    '+25.00',
    '-25.00',
  ];

  var _currentItemSelectedOE = '  0.00';
  var _ciloe = [
    '  0.00',
    '-0.25',
    '-0.50',
    '-0.75',
    '-1.00',
    '-1.25',
    '-1.50',
    '-1.75',
    '-2.00',
    '-2.25',
    '-2.50',
    '-2.75',
    '-3.00',
    '-3.25',
    '-3.50',
    '-3.75',
    '-4.00',
    '-4.25',
    '-4.50',
    '-4.75',
    '-5.00',
    '-5.25',
    '-5.50',
    '-5.75',
    '-6.00',
    '-6.25',
    '-6.50',
    '-6.75',
    '-7.00',
    '-7.25',
    '-7.50',
    '-7.75',
    '-8.00',
    '-8.25',
    '-8.50',
    '-8.75',
    '-9.00',
    '-10.25',
    '-10.50',
    '-10.75',
    '-11.00',
    '-11.25',
    '-11.50',
    '-11.75',
    '-12.00',
    '-12.25',
    '-12.50',
    '-12.75',
    '-13.00',
    '-13.25',
    '-13.50',
    '-13.75',
    '-14.00',
    '-14.25',
    '-14.50',
    '-14.75',
    '-15.00',
    '-15.25',
    '-15.50',
    '-15.75',
    '-16.00',
    '-17.25',
    '-17.50',
    '-17.75',
    '-18.00',
    '-18.25',
    '-18.50',
    '-18.75',
    '-19.00',
    '-19.25',
    '-19.50',
    '-19.75',
    '-20.00',
  ];
  var _currentItemSelectedCILOE = '  0.00';

  var _eixooe = [
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
    '55',
    '60',
    '65',
    '70',
    '75',
    '80',
    '85',
    '90',
    '95',
    '100',
    '105',
    '110',
    '115',
    '120',
    '125',
    '130',
    '135',
    '140',
    '145',
    '150',
    '155',
    '160',
    '165',
    '170',
    '175',
    '180'
  ];
  var _currentItemSelectedEIXOOE = '  0';
  var _add = [
    '  0.00',
    '0.75',
    '1.00',
    '1.25',
    '1.50',
    '1.75',
    '2.00',
    '2.25',
    '2.50',
    '2.75',
    '3.00',
    '3.25',
    '3.50'
  ];
  var _currentItemSelectedADD = '  0.00';

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
  bool _isButtonDisabled = true;

  String os = '';

  final pdf = pw.Document();
  writeOnPdf() {
    pdf.addPage(
      pw.MultiPage(
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
              pw.Paragraph(
                  text: "OD: $_currentItemSelectedOD ",
                  style: pw.TextStyle(
                    fontSize: 30.0,
                  )),
              pw.Paragraph(
                  text: '  Cil:  $_currentItemSelectedCILOD',
                  style: pw.TextStyle(
                    fontSize: 30.0,
                  )),
              pw.Paragraph(
                  text: '  Eixo:  $_currentItemSelectedEIXOOD',
                  style: pw.TextStyle(
                    fontSize: 30.0,
                  )),
            ]),
            pw.Row(children: [
              pw.Paragraph(
                  text: "OE: $_currentItemSelectedOE",
                  style: pw.TextStyle(
                    fontSize: 30.0,
                  )),
              pw.Paragraph(
                  text: '  Cil:  $_currentItemSelectedCILOE',
                  style: pw.TextStyle(
                    fontSize: 30.0,
                  )),
              pw.Paragraph(
                  text: '  Eixo:  $_currentItemSelectedEIXOOE',
                  style: pw.TextStyle(
                    fontSize: 30.0,
                  )),
            ]),
            pw.Row(children: [
              pw.Paragraph(
                  text: "Adição:  $_currentItemSelectedADD",
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
                  text: _currentItemSelected,
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
              ),
            ),
          ];
        },
      ),
    );
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
              'Ordem de serviço',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500),
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
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatter],
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      'OD:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    DropdownButton<String>(
                      items: _od.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelectedod) {
                        setState(() {
                          this._currentItemSelectedOD = newValueSelectedod;
                        });
                      },
                      value: _currentItemSelectedOD,
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      'Cil:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    DropdownButton<String>(
                      items: _cilod.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelectedcilod) {
                        setState(() {
                          this._currentItemSelectedCILOD =
                              newValueSelectedcilod;
                        });
                      },
                      value: _currentItemSelectedCILOD,
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      'Eixo:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    DropdownButton<String>(
                      items: _eixood.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelectedeixood) {
                        setState(() {
                          this._currentItemSelectedEIXOOD =
                              newValueSelectedeixood;
                        });
                      },
                      value: _currentItemSelectedEIXOOD,
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
                      'OE:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    DropdownButton<String>(
                      items: _oe.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelectedoe) {
                        setState(() {
                          this._currentItemSelectedOE = newValueSelectedoe;
                        });
                      },
                      value: _currentItemSelectedOE,
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      'Cil:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    DropdownButton<String>(
                      items: _ciloe.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelectedciloe) {
                        setState(() {
                          this._currentItemSelectedCILOE =
                              newValueSelectedciloe;
                        });
                      },
                      value: _currentItemSelectedCILOE,
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      'Eixo:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    DropdownButton<String>(
                      items: _eixooe.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelectedeixooe) {
                        setState(() {
                          this._currentItemSelectedEIXOOE =
                              newValueSelectedeixooe;
                        });
                      },
                      value: _currentItemSelectedEIXOOE,
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
                    'Adição:',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  DropdownButton<String>(
                    items: _add.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelectedadd) {
                      setState(() {
                        this._currentItemSelectedADD = newValueSelectedadd;
                      });
                    },
                    value: _currentItemSelectedADD,
                  ),
                ],
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
            padding: EdgeInsets.only(top: 50.0, left: 5.0, right: 5.0),
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
                child: Text('Gerar nova Ordem de serviço'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: _isButtonDisabled
                    ? null
                    : () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrdemServico()));
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
    setState(() => _isButtonDisabled = !_isButtonDisabled);
    setState(() {
      _converter();
    });
    setState(() async {
      writeOnPdf();
      await savePdf();
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      String fullPath = "$documentPath/OS:$os.pdf";
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PdfPreviewScreen(
                  path: fullPath,
                )),
      );
    });
  }
}

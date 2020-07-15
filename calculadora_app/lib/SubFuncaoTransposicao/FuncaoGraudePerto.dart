import 'package:calculadoraapp/Home.dart';
import 'package:flutter/material.dart';
import "package:calculadoraapp/ResultadoTransposicao/ResultadoGraudePerto.dart";
import 'package:firebase_admob/firebase_admob.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const String testDevice = '721A33913C7D7D311A5FB39652B0084B';

class FuncaoGraudePerto extends StatefulWidget {
  @override
  _FuncaoGraudePertoState createState() => _FuncaoGraudePertoState();
}

class _FuncaoGraudePertoState extends State<FuncaoGraudePerto> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Mortgage', 'Attorney'],
  );

  BannerAd _bannerAd;
  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-7677202089790115/3031795472',
        size: AdSize.smartBanner,
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

  TextEditingController _controllerEsfOD = TextEditingController();
  TextEditingController _controllerCILOD = TextEditingController();
  TextEditingController _controllerEIXOOD = TextEditingController();

  TextEditingController _controllerEsfOE = TextEditingController();
  TextEditingController _controllerCILOE = TextEditingController();
  TextEditingController _controllerEIXOOE = TextEditingController();

  TextEditingController _controllerADD = TextEditingController();

  var maskFormatterODLonge = new MaskTextInputFormatter(
      mask: '##.##', filter: {"#": RegExp(r'[+--0-9PLpl]')});
  var maskFormatterCILODLonge = new MaskTextInputFormatter(
      mask: '##.##', filter: {"#": RegExp(r'[+--0-9]')});
  var maskFormatterEixoODLonge =
      new MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

  var maskFormatterOELonge = new MaskTextInputFormatter(
      mask: '##.##', filter: {"#": RegExp(r'[+--0-9PLpl]')});
  var maskFormatterCILOELonge = new MaskTextInputFormatter(
      mask: '##.##', filter: {"#": RegExp(r'[+--0-9]')});
  var maskFormatterEixoOELonge =
      new MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

  var maskFormatterAdicao =
      new MaskTextInputFormatter(mask: '#.##', filter: {"#": RegExp(r'[0-9]')});

  double graudePertoOD = 0;
  double cilOD = 0;
  double eixoOD = 0;
  double graudePertoOE = 0;
  double cilOE = 0;
  double eixoOE = 0;

  var esfODlonge, esfOElonge, add;

  void _resultadoGraudePerto(BuildContext context) {
    double esfODlonge = double.tryParse(_controllerEsfOD.text);
    double cilODLonge = double.tryParse(_controllerCILOD.text);
    double eixoODLonge = double.tryParse(_controllerEIXOOD.text);

    double esfOElonge = double.tryParse(_controllerEsfOE.text);
    double cilOELonge = double.tryParse(_controllerCILOE.text);
    double eixoOELonge = double.tryParse(_controllerEIXOOE.text);

    double add = double.tryParse(_controllerADD.text);

    if (esfODlonge == null) {
      setState(() {
        esfODlonge = 0.0;
      });
    } else {
      esfODlonge = esfODlonge;
    }

    if (esfOElonge == null) {
      setState(() {
        esfOElonge = 0.0;
      });
    } else {
      esfOElonge = esfOElonge;
    }

    if (esfODlonge == esfODlonge && esfOElonge == esfOElonge) {
      setState(() {
        graudePertoOD = esfODlonge + add;
        cilOD = cilODLonge;
        eixoOD = eixoODLonge;

        graudePertoOE = esfOElonge + add;
        cilOE = cilOELonge;
        eixoOE = eixoOELonge;
      });
    }
    if (cilOD == null) {
      setState(() {
        cilOD = 0.0;
      });
    } else {
      cilOD = cilODLonge;
    }
    if (eixoOD == null) {
      setState(() {
        eixoOD = 0.0;
      });
    } else {
      eixoOD = eixoODLonge;
    }
    if (cilOE == null) {
      setState(() {
        cilOE = 0.0;
      });
    } else {
      cilOE = cilOELonge;
    }
    if (eixoOE == null) {
      setState(() {
        eixoOE = 0.0;
      });
    } else {
      eixoOE = eixoOELonge;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoGraudePerto(
            graudePertoOD: graudePertoOD = graudePertoOD,
            graudePertoOE: graudePertoOE = graudePertoOE,
            cilOD: cilOD = cilOD,
            eixoOD: eixoOD = eixoOD,
            cilOE: cilOE = cilOE,
            eixoOE: eixoOE = eixoOE,
          ),
        ));
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
              'Calculadora de perto',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  inputFormatters: [maskFormatterODLonge],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Esférico  Olho direito longe',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerEsfOD,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  inputFormatters: [maskFormatterCILODLonge],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Cilíndrico Olho direito longe',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerCILOD,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 5.0, left: 20.0, right: 30.0, bottom: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  inputFormatters: [maskFormatterEixoODLonge],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Eixo  Olho direito longe',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerEIXOOD,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  inputFormatters: [maskFormatterOELonge],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Esférico  Olho esquerdo longe',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerEsfOE,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  inputFormatters: [maskFormatterCILOELonge],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Cilíndrico Olho esquerdo longe',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerCILOE,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 5.0, left: 20.0, right: 30.0, bottom: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  inputFormatters: [maskFormatterEixoOELonge],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Eixo  Olho esquerdo longe',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerEIXOOE,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 45.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  inputFormatters: [maskFormatterAdicao],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Adição',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerADD,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 30.0, left: 20.0, right: 30.0, bottom: 5.0),
            child: RaisedButton(
                color: Color(0xff399d63),
                textColor: Colors.black,
                padding: EdgeInsets.all(15.0),
                child: Text('Calcular'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  _resultadoGraudePerto(context);
                }),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 5.0, left: 20.0, right: 30.0, bottom: 60.0),
            child: RaisedButton(
                color: Color(0xff399d63),
                textColor: Colors.black,
                padding: EdgeInsets.all(15.0),
                child: Text('Novo Calculo'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FuncaoGraudePerto()));
                }),
          )
        ],
      ),
    );
  }
}

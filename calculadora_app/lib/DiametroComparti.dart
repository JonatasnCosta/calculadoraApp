import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const String testDevice = '9A88AAC62836EFF2EF922D024CB9D9BE';

class DimetroComparti extends StatefulWidget {
  @override
  _DimetroCompartiState createState() => _DimetroCompartiState();
}

class _DimetroCompartiState extends State<DimetroComparti> {
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

  TextEditingController _controllerAro = TextEditingController();
  TextEditingController _controllerPonte = TextEditingController();
  TextEditingController _controllerMenorDnp = TextEditingController();
  TextEditingController _controllerMaiorDiagonal = TextEditingController();
  TextEditingController _controllerVertical = TextEditingController();
  var maskFormatter =
      new MaskTextInputFormatter(mask: '##.#', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterAro =
      new MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterPonte =
      new MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterVertical =
      new MaskTextInputFormatter(mask: '##.#', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterDiagonalMaior =
      new MaskTextInputFormatter(mask: '##.#', filter: {"#": RegExp(r'[0-9]')});
  NumberFormat fn = NumberFormat("0");

  double diametro = 0;
  double aro = 0;
  double ponte = 0;
  double menorDnp = 0;
  double maiorDiagonal = 0;

  void _resultadodiametro(BuildContext context) {
    double aro = double.tryParse(_controllerAro.text);
    double ponte = double.tryParse(_controllerPonte.text);
    double menorDnp = double.tryParse(_controllerMenorDnp.text);
    double maiorDiagonal = double.tryParse(_controllerMaiorDiagonal.text);

    if (aro == null ||
        ponte == null ||
        menorDnp == null ||
        maiorDiagonal == null) {
      setState(() {
        aro = 0;
        ponte = 0;
        menorDnp = 0;
        maiorDiagonal = 0;
      });
    } else {
      setState(() {
        diametro = aro + ponte - menorDnp * 2 + maiorDiagonal + 2;
      });
    }
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
                ]),
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Diâmetro do serviço',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
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
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterAro],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Aro',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
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
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterPonte],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Ponte',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerPonte,
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
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatter],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Menor DNP',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
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
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterVertical],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Vertical',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                  controller: _controllerVertical,
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
                  color: Color(0xff399d63)),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterDiagonalMaior],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Maior diagonal',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black),
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
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    _resultadodiametro(context);
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 120.0, bottom: 200.0),
                child: Text(
                  "Diâmetro:",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, bottom: 200.0),
                child: Text(
                  fn.format(diametro),
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

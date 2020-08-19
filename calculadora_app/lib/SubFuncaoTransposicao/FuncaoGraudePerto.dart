import 'package:calculadoraapp/Home.dart';
import 'package:flutter/material.dart';
import "package:calculadoraapp/ResultadoTransposicao/ResultadoGraudePerto.dart";
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'Mobile_id';

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

  double graudePertoOD = 0;
  double cilOD = 0;
  double eixoOD = 0;
  double graudePertoOE = 0;
  double cilOE = 0;
  double eixoOE = 0;
  dynamic olhoOD = '  0.00';
  dynamic olhoOE = '  0.00';
  dynamic olhoODPerto = '  0.00';
  dynamic olhoOEPerto = '  0.00';
  dynamic cilolhoODLonge = '  0.00';
  dynamic olhoODEixo = '  0';
  dynamic cilolhoOElonge = '  0.00';
  dynamic olhoOEEixo = '  0';
  dynamic olhoadicao = '  0.75';

  var esfODlonge, cilODLonge, eixoODLonge;
  var esfOElonge, cilOELonge, eixoOELonge;
  var add;

  void _resultadoGraudePerto(BuildContext context) {
    double esfODlonge = double.parse(olhoOD);
    double cilODLonge = double.parse(cilolhoODLonge);
    double eixoODLonge = double.parse(olhoODEixo);

    double esfOElonge = double.parse(olhoOE);
    double cilOELonge = double.parse(cilolhoOElonge);
    double eixoOELonge = double.parse(olhoOEEixo);

    double add = double.parse(olhoadicao);

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
                        value: olhoOD,
                        onChanged: (String newValueod) {
                          setState(() {
                            olhoOD = newValueod;
                          });
                        },
                        items: <String>[
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
                          '-25.00'
                        ].map<DropdownMenuItem<String>>((String valueod) {
                          return DropdownMenuItem<String>(
                              value: valueod, child: Text(valueod));
                        }).toList()),
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
                        value: cilolhoODLonge,
                        onChanged: (String newValuecilod) {
                          setState(() {
                            cilolhoODLonge = newValuecilod;
                          });
                        },
                        items: <String>[
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
                        ].map<DropdownMenuItem<String>>((String valuecilod) {
                          return DropdownMenuItem<String>(
                              value: valuecilod, child: Text(valuecilod));
                        }).toList()),
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
                        value: olhoODEixo,
                        onChanged: (String newValueeixood) {
                          setState(() {
                            olhoODEixo = newValueeixood;
                          });
                        },
                        items: <String>[
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
                        ].map<DropdownMenuItem<String>>((String valueeixood) {
                          return DropdownMenuItem<String>(
                              value: valueeixood, child: Text(valueeixood));
                        }).toList())
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
                        value: olhoOE,
                        onChanged: (String newValueoe) {
                          setState(() {
                            olhoOE = newValueoe;
                          });
                        },
                        items: <String>[
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
                        ].map<DropdownMenuItem<String>>((String valueoe) {
                          return DropdownMenuItem<String>(
                              value: valueoe, child: Text(valueoe));
                        }).toList()),
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
                        value: cilolhoOElonge,
                        onChanged: (String newValueciloe) {
                          setState(() {
                            cilolhoOElonge = newValueciloe;
                          });
                        },
                        items: <String>[
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
                        ].map<DropdownMenuItem<String>>((String valueoe) {
                          return DropdownMenuItem<String>(
                              value: valueoe, child: Text(valueoe));
                        }).toList()),
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
                        value: olhoOEEixo,
                        onChanged: (String newValueeixooe) {
                          setState(() {
                            olhoOEEixo = newValueeixooe;
                          });
                        },
                        items: <String>[
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
                        ].map<DropdownMenuItem<String>>((String valueeixooe) {
                          return DropdownMenuItem<String>(
                              value: valueeixooe, child: Text(valueeixooe));
                        }).toList()),
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
                      value: olhoadicao,
                      onChanged: (String newValueadd) {
                        setState(() {
                          olhoadicao = newValueadd;
                        });
                      },
                      items: <String>[
                        '  0.75',
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
                      ].map<DropdownMenuItem<String>>((String valueadd) {
                        return DropdownMenuItem<String>(
                            value: valueadd, child: Text(valueadd));
                      }).toList()),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0, bottom: 5.0),
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
            padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
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
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, left: 5.0, right: 5.0, bottom: 200.0),
            child: RaisedButton(
                color: Color(0xff399d63),
                textColor: Colors.black,
                padding: EdgeInsets.all(15.0),
                child: Text('Início'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
          ),
        ],
      ),
    );
  }
}

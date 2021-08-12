import 'package:calculadoraapp/app/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'Mobile_id';

class LinkMenu extends StatefulWidget {
  const LinkMenu({Key key}) : super(key: key);

  @override
  _LinkMenuState createState() => _LinkMenuState();
}

class _LinkMenuState extends State<LinkMenu> {
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

  Future<void> _lounchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      print('Não foi possivel execultar o link $url');
    }
  }

  void lounchWhatsApp({@required propraganda, @required message}) async {
    String urlWhatsApp = "whatsapp://send?&text=$propraganda, $message";
    await canLaunch(urlWhatsApp) ? launch(urlWhatsApp) : print("erro");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
                          MaterialPageRoute(builder: (context) => HomePage()));
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
              'Links últeis',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20.00,
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () => _lounchLink('https://jonatascosta.com'),
                  icon: Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Desenvolvedor',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20.00,
                ),
                TextButton.icon(
                  onPressed: () {
                    lounchWhatsApp(
                        propraganda:
                            "Olha esse ótimo aplicativo para sua ótica",
                        message:
                            'https://play.google.com/store/apps/details?id=com.jonatasprogramador.calculadora_app');
                  },
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Envie para um amigo!',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20.00,
                ),
                TextButton.icon(
                  onPressed: () =>
                      _lounchLink('https://www.linkedin.com/in/jonatasncosta'),
                  icon: Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Linkedin',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

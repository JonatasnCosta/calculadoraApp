import 'package:flutter/material.dart';
import 'package:share/share.dart';



class Transposicao extends StatefulWidget {
  @override
  _TransposicaoState createState() => _TransposicaoState();
}

class _TransposicaoState extends State<Transposicao> {
TextEditingController _controllerAlcool = TextEditingController();
TextEditingController _controllerGasolina = TextEditingController();




  String text = "  _controllerGasolina.text, _controllerAlcool.text";
  

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plugin Demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Share Plugin Demo'),
          ), 
          body:  Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Share text:',
                    hintText: 'Enter some text and/or link to share',
                  ),
                  controller: _controllerAlcool,
                
                 onChanged: (String value) => setState(() {
                    text = value;
                  }),
                ),
                TextField(
                   keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Share subject:',
                    hintText: 'Enter subject to share (optional)',
                  ),
                  controller: _controllerGasolina,
                  
                  onChanged: (String value) => setState(() {
                    text = value;
                  }),
                ),
                const Padding(padding: EdgeInsets.only(top: 24.0)),
               Builder(
                  builder: (BuildContext context) {
                    return RaisedButton(
                      child: const Text('Share'),
                      onPressed: text.isEmpty
                          ? null
                          : () {
                              // A builder is used to retrieve the context immediately
                              // surrounding the RaisedButton.
                              //
                              // The context's `findRenderObject` returns the first
                              // RenderObject in its descendent tree when it's not
                              // a RenderObjectWidget. The RaisedButton's RenderObject
                              // has its position and size after it's built.
                              final RenderBox box = context.findRenderObject();
                              Share.share(text,
                                    sharePositionOrigin:
                                      box.localToGlobal(Offset.zero) &
                                          box.size);
                            }
                    );
                  },
                ),
              ],
            ),
          )
          ),
    );
  }
}
import 'package:calculadoraapp/Home.dart';
import 'package:calculadoraapp/SubFuncaoOrdemdeservico/OrdemGerada.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';






class OrdemServico extends StatefulWidget {
  @override
  _OrdemServicoState createState() => _OrdemServicoState();
}


class _OrdemServicoState extends State<OrdemServico> {
 TextEditingController _controllerNumeroCliente = TextEditingController(); 
TextEditingController _controllerNomeotica = TextEditingController();
TextEditingController _controllerData = TextEditingController();
TextEditingController _controllerOS = TextEditingController();
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
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => Home()));
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
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
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
                   keyboardType: TextInputType.text,
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
                   keyboardType: TextInputType.text,
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
                   keyboardType: TextInputType.text,
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
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 100.0),
            child: RaisedButton(
              color: Color(0xff399d63),
              textColor: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text('Gerar Ordem de serviço'),
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff399d63))
              ),
              onPressed: (){
                _enviardadosParaOrdemGerada(context);
              }
            ),
          ),
        ],
      ),
  );

  }
  void _enviardadosParaOrdemGerada(BuildContext context) {
    String nomeotica = _controllerNomeotica.text;
    String numerocliente = _controllerNumeroCliente.text;
    String data = _controllerData.text;
    String os = _controllerOS.text;
    String tipodelente = _controllerTipodelente.text;
    String tratamento = _controllerTratamento.text;
    String odgrau = _controllerODGrau.text;
    String oegrau = _controllerOEGrau.text;
    String add = _controllerADD.text;
    String dnpod = _controllerDNPOD.text;
    String dnpoe = _controllerDNPOE.text;
    String altura = _controllerAltura.text;
    String diametro = _controllerDiametro.text;
    String tipodearo = _controllerTipodearo.text;
    String obeservacoes = _controllerObservacoes.text;
    // Transforma os dados em string
    
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrdemGerada( 
           texonumerocliente: numerocliente,
           textonome : nomeotica,
           textodata : data,
           textoos : os,
           textotipodelente: tipodelente,
           textotratamento: tratamento,
           textoodgrau: odgrau,
           textooegrau: oegrau,
           textoadd: add,
           textodnpod: dnpod,
           textodnpoe: dnpoe,
           textoaltura: altura,
           textodiametro: diametro,
           textotipodearo: tipodearo,
           textoobs: obeservacoes,

          ),   
        ));
         // Método para capturar os dados
        // obtendo o texto do local da String e iniciando a tela secundária
  }
}



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:proj_marvel/Controller/home_page_controller.dart';
import 'package:proj_marvel/Model/moeda_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homeController = new HomePageController();
  TextEditingController _textEditingController = new TextEditingController();

  var _valueOrigem = "BRL", _valueDestino = "USD";

  List<Moeda> dropdownlist = new List();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Conversão de Moeda"),
        leading: Icon(Icons.menu),
        actions: <Widget>[
          GestureDetector(
            onTap: () {

              homeController.recuperaHistoricos();
              Navigator.of(context).pushNamed('/historicoPage');
            } ,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
              child: Column(
                children: <Widget>[Icon(Icons.timer), Text("Histórico")],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(40, 50, 40, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Moeda de Origem:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 18),
                  ),
                  FutureBuilder(
                      future: homeController.getListaRates(),
                      builder: (context, data) {
                        if (!data.hasData)
                          return DropdownButton(
                              isExpanded: true,
                              value: "BRL",
                              items: [
                                DropdownMenuItem(
                                  value: "BRL",
                                  child: Text("BRL"),
                                )
                              ].toList(),
                              onChanged: null);

                        List<Moeda> moedas = data.data;
                        return DropdownButton<String>(
                          value: _valueOrigem,
                          isExpanded: true,
                          items: moedas.map((item) {
                            return DropdownMenuItem(
                              value: item.nome,
                              child: Text(item.nome),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valueOrigem = value;
                            });
                          },
                        );
                      }),
                  TextFormField(
                    keyboardType: TextInputType.number,

                    
                    autovalidate: true,
                    controller: _textEditingController,
                    validator: (value) => value.isEmpty ? 'Preencha o campo' : null ,
                    decoration: InputDecoration(labelText: "Valor \$",
                    ),
                    
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Moeda Desejada para Conversão:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 18),
                  ),
                  FutureBuilder(
                      future: homeController.getListaRates(),
                      builder: (context, data) {
                        if (!data.hasData)
                          return DropdownButton(
                              isExpanded: true,
                              value: "USD",
                              items: [
                                DropdownMenuItem(
                                  value: "USD",
                                  child: Text("USD"),
                                )
                              ].toList(),
                              onChanged: null);

                        List<Moeda> moedas = data.data;
                        return DropdownButton<String>(
                          value: _valueDestino,
                          isExpanded: true,
                          items: moedas.map((item) {
                            return DropdownMenuItem(
                              value: item.nome,
                              child: Text(item.nome),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valueDestino = value;
                            });
                          },
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Valor Convertido \$",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Observer(
                    builder: (_) => Text(
                        homeController.result
                            .toStringAsFixed(2)
                            .replaceAll(".", ","),
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {

                    if(_textEditingController.text != "")
                    {
                       homeController.convertMoeda(_textEditingController.text,
                        _valueOrigem, _valueDestino);
                    }
                   

                    
                  },
                  child: Text(
                    "Converter",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

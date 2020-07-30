import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conversão de Moeda"),
      leading: Icon(Icons.menu),
      actions: <Widget>[
        Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(0, 10 ,20,0),
        child: Column(children: <Widget>[
        Icon(Icons.timer),
        Text("Histórico")

        ],),)
       
      ],),
    );
  }
}

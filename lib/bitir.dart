import 'package:flutter/material.dart';

class Bitir extends StatefulWidget {
  @override
  _BitirState createState() => _BitirState();
}

class _BitirState extends State<Bitir> {
  String name;
  String number;
  int puan;
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    name = data[0];
    number = data[1];
    puan = data[2];
    return Scaffold(
      body: Center(
        child: Text("Tebrikler: " + name +
            "\nNumaranız: " + number +
        "\nPuanınız: " + puan.toString(), style: TextStyle(fontSize: 24),),
      ),
    );
  }
}

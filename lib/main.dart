import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinav/bitir.dart';
import 'package:sinav/hakkinda.dart';
import 'package:sinav/sorular.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/sorular': (context) => Sorular(),
      '/bitir': (context) => Bitir(),
      '/hakkinda': (context) => Hakkinda(),
    },
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Ogrenci{
  String name;
  String number;
}

class _MyHomePageState extends State<MyHomePage> {
  final namecont = TextEditingController();
  final numbercont = TextEditingController();
  void checkInfo(Ogrenci ogrenci) {
    var data = [];
    data.add(ogrenci.name);
    data.add(ogrenci.number);
    if (ogrenci.name.length > 5 && ogrenci.number.length == 9) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Sorular(),
                            settings: RouteSettings(
                              arguments: data,
                            ),
                            ));
    } else
      print("Lütfen geçerli bilgileri giriniz");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('e-Sınav'),
          ),
          body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("Öğrenci Bilgilerinizi Giriniz",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 8, 100, 8),
                  child: TextField(
                    controller: namecont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ad ve Soyad",
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 8, 100, 8),
                  child: TextField(
                    controller: numbercont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Öğrenci Numarası",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 8, 100, 8),
                  child: ElevatedButton(
                    onPressed: (){
                      Ogrenci ogr = Ogrenci();
                      ogr.name = namecont.text;
                      ogr.number = numbercont.text;
                      checkInfo(ogr);
                    },

                    child: Text("Sınavı Başlat"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/hakkinda'),
                    child: Text("Hakkında"),
                  ),
                ),
              ])),
    );
  }
}

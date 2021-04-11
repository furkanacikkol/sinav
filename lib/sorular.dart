import 'package:flutter/material.dart';
import 'package:sinav/bitir.dart';

var sorular = [
  {
    'soru': 'Fatih Sultan Mehmet\'in babası kimdir?',
    'cevaplar': ['I. Mehmet', 'II. Murat', 'Yıldırım Beyazıt'],
    'dogrucevap': 'II. Murat'
  },
  {
    'soru': 'Hangi yabancı futbolcu Fenerbahçe forması giymiştir?',
    'cevaplar': ['Simoviç', 'Schumacher', 'Prekazi'],
    'dogrucevap': 'Schumacher'
  },
  {
    'soru': 'Magna Carta hangi ülkenin kralıyla yapılmış bir sözleşmedir?',
    'cevaplar': ['İngiltere', 'Fransa', 'İspanya'],
    'dogrucevap': 'İngiltere'
  },
  {
    'soru': 'Hangisi tarihteki Türk devletlerinden biri değildir?',
    'cevaplar': ['Avar Kağanlığı', 'Emevi Devleti', 'Hun İmparatorluğu'],
    'dogrucevap': 'Emevi Devleti'
  },
  {
    'soru': 'Hangi ülke Asya kıtasındadır?',
    'cevaplar': ['Madagaskar', 'Peru', 'Singapur'],
    'dogrucevap': 'Singapur'
  },
  {
    'soru':
        'ABD başkanlarından John Fitzgerald Kennedy’e suikast düzenleyerek öldüren kimdir?',
    'cevaplar': ['Lee Harvey Oswald', 'Clay Shaw', 'Jack Ruby'],
    'dogrucevap': 'Lee Harvey Oswald'
  },
  {
    'soru':
        'Aşağıdaki hangi Anadolu takımı Türkiye Süper Liginde şampiyon olmuştur?',
    'cevaplar': ['Kocaelispor', 'Bursaspor', 'Eskişehirspor'],
    'dogrucevap': 'Bursaspor'
  },
  {
    'soru': 'Hangisi Kanuni Sultan Süleyman’ın eşidir?',
    'cevaplar': ['Safiye Sultan', 'Kösem Sultan', 'Hürrem Sultan'],
    'dogrucevap': 'Hürrem Sultan'
  },
  {
    'soru': 'Hangi hayvan memeli değildir?',
    'cevaplar': ['Penguen', 'Yunus', 'Yarasa'],
    'dogrucevap': 'Penguen'
  },
  {
    'soru': 'Osmanlı’da Lale devri hangi padişah döneminde yaşamıştır?',
    'cevaplar': ['III. Ahmet', 'IV. Murat', 'III. Selim'],
    'dogrucevap': 'III. Ahmet'
  },
];

class Sorular extends StatefulWidget {
  @override
  _SorularState createState() => _SorularState();
}

class _SorularState extends State<Sorular> {
  String name;
  String number;
  int puan = 0;
  int current = 0;

  void checkAnswer(String str) {
    if (current > 8) {
      var newData = [];
      newData.add(name);
      newData.add(number);
      newData.add(puan);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Bitir(),
            settings: RouteSettings(
              arguments: newData,
            ),
          ));
    } else {
      if (str == sorular[current]['dogrucevap'].toString()) {
        current++;
        puan += 10;
      } else {
        current++;
        puan -= 10;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    name = data[0];
    number = data[1];
    var cevaplar = [];
    cevaplar = sorular[current]['cevaplar'];
    return Scaffold(
        body: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          "Öğrenci: " + name.toUpperCase() + "\nÖğrenci numaranız: " + number,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 0, 0),
        child: Text((current + 1).toString() +
            ") " +
            sorular[current]['soru'].toString()),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              checkAnswer(cevaplar[0].toString());
            });
          },
          child: Text(cevaplar[0].toString()),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              checkAnswer(cevaplar[1].toString());
            });
          },
          child: Text(cevaplar[1].toString()),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              checkAnswer(cevaplar[2].toString());
            });
          },
          child: Text(cevaplar[2].toString()),
        ),
      )
    ]));
  }
}

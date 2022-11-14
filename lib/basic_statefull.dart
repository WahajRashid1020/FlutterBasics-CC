import 'dart:math';

import 'package:flutter/material.dart';

class BasicStatefull extends StatefulWidget {
  const BasicStatefull({Key? key}) : super(key: key);

  @override
  _BasicStatefullState createState() => _BasicStatefullState();
}

class _BasicStatefullState extends State<BasicStatefull> {
  int coinHead = 0;
  Random coinSide = new Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Text('This coin is: ' + (coinHead == 1 ? "Heads" : "tails"))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.attach_money),
            onPressed: () {
              setState(() {
                coinHead = coinSide.nextInt(2);
              });
              print(coinHead);
            }),
        body: Center(
            child: Container(
                child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text("Statfull"),
            )
          ],
        ))));
  }
}

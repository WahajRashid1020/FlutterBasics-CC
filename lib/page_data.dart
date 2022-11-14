import 'package:flutter/material.dart';

class PageData extends StatelessWidget {
  // String message;
  var namefromHome;
  var phonefromHome;
  PageData(this.namefromHome, this.phonefromHome);
  // ConstructorScreen(String m) {
  //   this.message = m;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Passing Data Stateless")),
      body: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Text(namefromHome),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Text(phonefromHome),
          ),
        ]),
      ),
    );
  }
}

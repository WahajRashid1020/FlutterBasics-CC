import 'package:flutter/material.dart';

class PagefullData extends StatefulWidget {
  var namefromHome;
  var phonefromHome;
  PagefullData({this.namefromHome, this.phonefromHome});
  @override
  _PagefullDataState createState() => _PagefullDataState();
}

class _PagefullDataState extends State<PagefullData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Passing Data Statefull")),
      body: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Text(widget.namefromHome),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Text(widget.phonefromHome),
          ),
        ]),
      ),
    );
  }
}

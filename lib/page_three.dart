import 'package:example/page_data.dart';
import 'package:example/pagefull_data.dart';
import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  String value = "";
  var _name = TextEditingController();
  var _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: TextField(
                    // onChanged: (text) => value = text,
                    controller: _name,
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: "Enter a name number",
                        labelText: "Name"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: TextField(
                    // onChanged: (text) => value = text,
                    controller: _phone,
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: "Enter a phone number",
                        labelText: "Phone"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 150.0, right: 150.0, top: 40),
                  child: ElevatedButton(
                    child: Text("Submit Stateless"),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/fourth');
                      // arguments: "It is what it is");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageData(
                              _name.text.toString(), _phone.text.toString()),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 150.0, right: 150.0, top: 40),
                  child: ElevatedButton(
                    child: Text("Submit Statefull"),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/fourth');
                      // arguments: "It is what it is");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PagefullData(
                              namefromHome: _name.text.toString(),
                              phonefromHome: _phone.text.toString()),
                        ),
                      );
                    },
                  ),
                )
              ],
            )));
  }
}

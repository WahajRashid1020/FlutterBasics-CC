import 'package:flutter/material.dart';

class BasicForm extends StatefulWidget {
  @override
  MyForm createState() {
    return MyForm();
  }
}

void tap() {
  print("Clicked");
}

class MyForm extends State<BasicForm> {
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.phone),
              hintText: "Enter a phone number",
              labelText: "Phone"),
        ),
        Container(
          padding: EdgeInsets.only(left: 150.0, right: 150.0, top: 40),
          child: ElevatedButton(
            child: Text("Submit"),
            onPressed: tap,
          ),
        )
      ],
    ));
  }
}

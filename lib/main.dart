import 'package:example/basic_statefull.dart';
import 'package:example/homepage.dart';
import 'package:example/myapi.dart';
import 'package:example/page_one.dart';
import 'package:example/page_three.dart';
import 'package:example/page_two.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'login_page.dart';
import 'basic_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "/", routes: {
      '/': (context) => const PageOne(),
      '/second': (context) => const PageTwo(),
      '/login': (context) => const PageThree(),
      '/fourth': (context) => const BasicStatefull(),
      '/multiple': (context) => Homepage(),
      '/single': (context) => const Myapi(),
    });
  }
}

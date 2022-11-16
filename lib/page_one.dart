import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main Screen"),
        ),
        body: Container(
          child: Column(
            children: [
              Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/second');
                        },
                        child: Text("Second Screen"),
                      ))),
              Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/single');
                        },
                        child: Text("Fetch Single Data"),
                      ))),
              Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/multiple');
                        },
                        child: Text("Fetch Multiple Data"),
                      ))),
            ],
          ),
        )
        // Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/second');
        //     },
        //     child: Text("Second Screen"),
        //   ),
        // ),
        );
  }
}

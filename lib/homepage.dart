import 'dart:async';
import 'dart:convert';
import 'package:example/myapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//LIST  DATA
Future<List<Data>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  final double price;
  final int id;
  final String title;

  const Data({
    required this.price,
    required this.id,
    required this.title,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      price: json['price'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(Homepage());

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ListView'),
        ),
        body: Center(
          child: FutureBuilder<List<Data>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data>? data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myapi(
                                    id: data[index].id,
                                    title: data[index].title,
                                    price: data[index].price,
                                  )),
                        ),
                        shape: RoundedRectangleBorder(
                          //<-- SEE HERE
                          side: BorderSide(width: 2, color: Colors.white),

                          borderRadius: BorderRadius.circular(20),
                        ),
                        tileColor: Colors.blueGrey[400],
                        leading: FlutterLogo(),
                        title: Center(
                          child: Text(data![index].title),
                        ),
                        trailing: Icon(Icons.more_vert),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
// showDialog<String>(
//                           context: context,
//                           builder: (BuildContext context) => AlertDialog(
//                             title: Text(data![index].title),
//                             content: const Text('AlertDialog description'),
//                             actions: <Widget>[
//                               TextButton(
//                                 onPressed: () =>
//                                     Navigator.pop(context, 'Cancel'),
//                                 child: const Text('Cancel'),
//                               ),
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context, 'OK'),
//                                 child: const Text('OK'),
//                               ),
//                             ],
//                           ),
//                         ),
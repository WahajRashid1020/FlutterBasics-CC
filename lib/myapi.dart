import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//SINGLE DATA

class Album {
  final double price;
  final int id;
  final String title;

  const Album({
    required this.price,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      price: json['price'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class Myapi extends StatefulWidget {
  var id;
  var title;
  var price;
  Myapi(
      {super.key, required this.id, required this.price, required this.title});

  @override
  State<Myapi> createState() => _MyapiState();
}

class _MyapiState extends State<Myapi> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/${widget.id}'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(json.decode(response.body));
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id.toString()),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.price);
              return Center(
                  child: Column(
                children: [
                  Container(
                    child: Text(snapshot.data!.title),
                  ),
                  Container(
                    child: Text(snapshot.data!.price.toString()),
                  ),
                  Container(
                    child: Text(snapshot.data!.id.toString()),
                  ),
                ],
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

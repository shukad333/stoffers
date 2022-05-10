import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store/store.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<List<Store>> fetchData() async {
  print("here");
  final response = await http.get(Uri.https(
      '62776ce208221c968464e0e3.mockapi.io', '/api/v1/myBaby/stores'));
  print(response.statusCode);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Store.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Store>> data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ListView Test'),
        ),
        body: Center(
          child: FutureBuilder<List<Store>>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Store>? stores = snapshot.data;
                return ListView.builder(
                    itemCount: stores?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 75,
                        color: Colors.white,
                        child: Center(
                          child: Text(stores![index].name),
                        ),
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


import 'package:flutter/material.dart';
import 'package:flutter_app/example/d05/page/Detail.dart';
import 'package:flutter_app/example/d05/page/Home.dart';
import 'package:flutter_app/example/d05/page/Update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => Home(),
        "/detail" : (context) => Detail(),
        "/update" : (context) => Update()
      }
    );
  }
}
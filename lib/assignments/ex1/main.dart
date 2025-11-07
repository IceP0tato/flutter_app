
import 'package:flutter/material.dart';
import 'package:flutter_app/assignments/ex1/Get.dart';
import 'package:flutter_app/assignments/ex1/Home.dart';
import 'package:flutter_app/assignments/ex1/Post.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => Home(),
        "/post" : (context) => Post(),
        "/get" : (context) => Get()
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/example/d04/pages/DetailPage.dart';
import 'package:flutter_app/example/d04/pages/HomePage.dart';
import 'package:flutter_app/example/d04/pages/InfoPage.dart';
import 'package:flutter_app/example/d04/pages/MainPage.dart';
import 'package:flutter_app/example/d04/pages/SettingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: { // 경로와 해당 위젯을 연결하는 MAP
        "/" : (context) => MainPage(),
        "/home" : (context) => HomePage(),
        "/info" : (context) => InfoPage(),
        "/setting" : (context) => SettingPage(),
        "/detail" : (context) => DetailPage(),
      }
    );
  }
}
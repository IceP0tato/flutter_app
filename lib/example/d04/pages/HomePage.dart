import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {Navigator.pushNamed(context, "/detail");},
            child: Text("특정 페이지로 이동"))
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/assignments/ex1/Get.dart';
import 'package:flutter_app/assignments/ex1/Post.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int pageIndex = 0;
  dynamic pages = [
    Center(child: Text("Spring JPA - Flutter 실습 예제")),
    Post(),
    Get()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {setState(() {
          pageIndex = index;
        });},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: "POST"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "GET"
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/example/d04/pages/HomePage.dart';
import 'package:flutter_app/example/d04/pages/InfoPage.dart';
import 'package:flutter_app/example/d04/pages/SettingPage.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentPageIndex = 0; // 현재 화면에 보이는 페이지 번호
  dynamic pages = [
    HomePage(), // index 0 -> HomePage
    InfoPage(), // index 1 -> InfoPage
    SettingPage() // index 2 -> SettingPage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPageIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex, // 현재 선택된 버튼 번호
          onTap: (index) {setState(() {currentPageIndex = index;});}, // bottom 메뉴의 아이템 클릭 이벤트
          items: [ // bottom 메뉴에 들어갈 버튼들
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "HOME"
            ), // 0
            BottomNavigationBarItem(
                icon: Icon(Icons.info, size: 30),
                label: "Info"
            ), // 1
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, color: Colors.red),
                label: "Setting"
            )
          ])
    );
  }
}
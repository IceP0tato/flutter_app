import 'package:flutter/material.dart';

// 위젯 (화면을 구성하는 가장 작은 단위 = 컴포넌트) 작성
class WidgetClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp(속성명: 출력할 위젯);
    return MaterialApp(home: Text("Hello World"));
  }
}

class WidgetClass2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold(K: V, K: V);
      home: Scaffold(
          appBar: AppBar(title: Text("App Bar")), // 상단 바
          body: Center(child: Text("Body")), // 본문
          bottomNavigationBar: BottomAppBar(child: Text("Bottom Bar")) // 하단 바
      )
    );
  }
}

void main() {
  print("Hello World");
  runApp(WidgetClass2()); // 최초로 실행되는 위젯
}
import 'package:flutter/material.dart';

// 최초 실행 위젯
void main() {
  runApp(MyApp());
}

// 상태가 없는 위젯 (재렌더링 없을 때 사용)
class MyApp extends StatelessWidget {
  // event
  int count = 0;
  void increment() {
    count++;
    print(count);
  }

  // build 함수 재구현
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text("상단 제목")),
      body: Center(
          child: Column(
            children: [
              Text("세로 정렬 첫 번째 위젯"),
              Text("세로 정렬 두 번째 위젯"),
              TextButton(onPressed: increment, child: Text("세로 정렬 세 번째 위젯")),
              Text("세로 정렬 네번째 위젯 : ${count}")
            ]
          )
      )
    ));
  }
}
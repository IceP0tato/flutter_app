import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 상태가 있는 위젯
class MyApp extends StatefulWidget {
  // 상태를 관리할 하위 위젯들을 등록
  // 하위 위젯들은 상위 위젯을 상속받아야 함 -> State<상위 위젯명>
  // (등록할 위젯명 createState() => 등록할 위젯명();)
  MyAppState createState() => MyAppState();
}

// 상태 사용 위젯 별도 선언
class MyAppState extends State<MyApp> {
  int count = 0;

  // 상태 변경 / 재렌더링
  // setState(() { 새로운 값; })
  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("상단 제목")),
        body: Center(
          child: Column(
            children: [
              Text("count : ${count}"),
              TextButton(onPressed: increment, child: Text("버튼"))
            ],
          ),
        )
      ),
    );
  }
}
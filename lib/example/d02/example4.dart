import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 플러터 앱의 시작점 위젯
// stateless -> build()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IOwidget()
    );
  }
}

// 상태가 있는 위젯
// stateful -> createState()
class IOwidget extends StatefulWidget {
  IOwidgetState createState() => IOwidgetState();
}

class IOwidgetState extends State<IOwidget> {
  // TextField 로부터 입력받은 값들을 제어하는 제어 변수
  TextEditingController nameCont = TextEditingController();
  TextEditingController ageCont = TextEditingController();
  void onSave() {
    print(nameCont.text); // 현재 컨트롤러와 연결된 입력받은 값 반환
    print(ageCont.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("입출력")),
      body: Column(
        children: [
          TextField(controller: nameCont),
          TextField(controller: ageCont, decoration: InputDecoration(labelText: "나이 입력")),
          TextButton(onPressed: onSave, child: Text("등록"))
        ],
      ),
    );
  }
}
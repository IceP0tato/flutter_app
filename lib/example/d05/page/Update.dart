import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Update extends StatefulWidget {
  UpdateState createState() => UpdateState();
}

class UpdateState extends State<Update> {
  @override
  void didChangeDependencies() {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    findById(id);
  }

  dynamic todo = {};
  void findById(int id) async {
    try {
      final response = await dio.get("http://192.168.40.187:8080/api/todo/detail?id=${id}");
      final data = response.data;

      setState(() {
        todo = data;
        titleCont.text = data['title'];
        contentCont.text = data['content'];
      });
    } catch (e) {
      print(e);
    }
  }

  void update() async {
    try {
      final obj = {
        "id": todo['id'],
        "title": titleCont.text,
        "content": contentCont.text,
        "done": todo['done']
      };

      final response = await dio.put("http://192.168.40.187:8080/api/todo", data: obj);
      final data = response.data;
      if (data != null) {
        Navigator.pop(context, true); // 부모 페이지로 이동 (뒤로가기) -> 현재 위젯을 제거하면서 true 반환
      }
    } catch (e) {
      print(e);
    }
  }

  // 입력 상자 제어 컨트롤러
  TextEditingController titleCont = TextEditingController();
  TextEditingController contentCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO 수정")),
      body: Column(
        children: [
          TextField(controller: titleCont, maxLength: 30),
          SizedBox(height: 20),
          TextField(
              controller: contentCont,
              maxLength: 255,
              maxLines: 5
          ),
          SizedBox(height: 20),
          Text("완료 여부"),
          Switch( // 스위치 버튼
              value: todo['done'] ?? false,
              onChanged: (value) {setState(() {
                todo['done'] = value;
              });}),
          OutlinedButton(onPressed: update, child: Text("수정하기"))
        ],
      ),
    );
  }
}
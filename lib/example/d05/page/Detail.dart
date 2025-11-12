import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Detail extends StatefulWidget {
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {

  // 위젯 최초 실행 시 렌더링
  @override
  void initState() {

  }

  // 이전(부모) 위젯 변경 시 렌더링
  @override
  void didChangeDependencies() {
    // 부모 위젯에서 상세 버튼을 클릭할 때마다 서로 다른 매개변수를 가져옴
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
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO 상세")),
      body: Padding(padding: EdgeInsets.fromLTRB(40, 40, 40, 40), child: Column( // 상하좌우 여백
        crossAxisAlignment: CrossAxisAlignment.start, // 세로 배치 방법에서 왼쪽 정렬
        children: [
          Text("제목: ${todo['title']}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("내용: ${todo['content']}", style: TextStyle(fontSize: 15, color: Colors.cyan)),
          SizedBox(height: 20),
          Text("완료 여부: ${todo['done']==true?"완료":"미완료"}", style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text("등록일: ${todo['createDate']}", style: TextStyle(fontSize: 18))
        ],
      ),
    ));
  }
}
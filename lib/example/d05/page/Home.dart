import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    findAll();
  }

  List<dynamic> todoList = [];
  void findAll() async {
    try {
      final response = await dio.get("http://192.168.40.187:8080/api/todo");
      final data = response.data;

      setState(() {
        todoList = data;
      });
    } catch (e) {
      print(e);
    }
  }

  void delete(int id) async {
    try {
      final response = await dio.delete("http://192.168.40.187:8080/api/todo?id=${id}");
      final data = response.data;

      if (data == true) {
        findAll();
      }

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TODO")),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                      children: // 반복문을 이용하여 ListView 에 여러 개의 Card 대입
                      todoList.map((todo) { // map 은 dynamic 매핑 불가능
                        return Card(child: ListTile(
                          title: Text(todo['title']), // Card 제목 위젯
                          subtitle: Row(children: [Text(todo['content']), Text(todo['createDate'])]),
                          trailing: Row( // 가로 배치 위젯
                            mainAxisSize: MainAxisSize.min, // Row 배치에서 오른쪽 버튼(위젯)들의 넓이를 최소 크기로 할당
                            children: [
                              IconButton(
                                  onPressed: () {delete(todo['id']);},
                                  icon: Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {
                                    final result = Navigator.pushNamed(context, "/update", arguments: todo['id']);
                                    print(result);
                                    // update pop 시 반환값 처리 (true 시 데이터 새로고침)
                                    if (result == true) { findAll(); }
                                    },
                                  icon: Icon(Icons.edit)),
                              IconButton( // 페이지 이동: Navigator.pushNamed(현 위젯, 이동할 경로, 매개변수)
                                  onPressed: () {Navigator.pushNamed(context, "/detail", arguments: todo['id']);},
                                  icon: Icon(Icons.info, size: 30))
                            ],
                          ),
                        ));
                      }).toList()
                  )
              )
            ],
          ),
        )
    );
  }
}
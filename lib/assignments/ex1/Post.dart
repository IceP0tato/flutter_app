import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  PostState createState() => PostState();
}

class PostState extends State<Post> {
  TextEditingController titleCont = TextEditingController();
  TextEditingController contentCont = TextEditingController();

  void createTodo() async {
    final obj = { 'title': titleCont.text, 'content': contentCont.text };
    try {
      final dio = Dio();
      final response = await dio.post("http://192.168.40.187:8080/api/todo", data: obj);
      final data = response.data;
      print(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TODO 등록")),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                children: [
                  TextField(decoration: InputDecoration(labelText: "제목"),
                      controller: titleCont
                  ), SizedBox(height: 20),
                  TextField(decoration: InputDecoration(labelText: "내용"),
                    controller: contentCont,
                  ), SizedBox(height: 20),
                  ElevatedButton(onPressed: createTodo, child: Text("등록"))
                ]
            )
        )
    );
  }
}
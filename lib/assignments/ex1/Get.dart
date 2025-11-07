import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Get extends StatefulWidget {
  GetState createState() => GetState();
}

class GetState extends State<Get> {
  dynamic todoList = [];

  void getTodoList() async {
    try {
      final dio = Dio();
      final response = await dio.get("http://192.168.40.187:8080/api/todo/list");
      final data = response.data;
      print(data);

      setState(() {
        todoList = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TODO 목록")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  dynamic item = todoList[index];
                  return Card(child: ListTile(
                    title: Text(item['title']),
                    subtitle: Text(item['content'])
                  ));
                },
              ))
            ],
          ),
        )
    );
  }
}
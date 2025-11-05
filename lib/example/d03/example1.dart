// https://pub.dev/  (The official package repository for Dart and Flutter apps)

import 'package:dio/dio.dart';
final dio = Dio();

// GET
void getEvent() async {
  try {
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts/1");
    print("Get Data : ${response.data}");
  } catch(e) {
    print("Get Error : ${e}");
  }
}

// POST
void postEvent() async {
  try {
    final obj = {"title": "foo", "body": "bar", "userId": 1};
    final response = await dio.post("https://jsonplaceholder.typicode.com/posts", data: obj);
    print("Post Data : ${response.data}");
  } catch(e) {
    print("Post Error : ${e}");
  }
}

void main() {
  print("Dart Start");
  getEvent();
  postEvent();
}
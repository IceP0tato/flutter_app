import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// main.jsx
void main() {
  runApp(MyApp());
}

// App.jsx
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GoodsWidget());
  }
}

// Component
class GoodsWidget extends StatefulWidget {
  GoodsWidgetState createState() => GoodsWidgetState();
}

class GoodsWidgetState extends State<GoodsWidget> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController priceCont = TextEditingController();
  TextEditingController descCont = TextEditingController();

  void goodsSave() async {
    final obj = { 'gname': nameCont.text, 'gprice': priceCont.text, 'gdesc': descCont.text };
    print(obj);

    try {
      final dio = Dio();
      // 모바일은 http 없음 = localhost 사용 불가. 모바일에서는 IP 사용
      final response = await dio.post("http://192.168.40.187:8080/api/goods", data: obj);
      final data = response.data;
      print(data);

      // 저장 성공된 자료를 추가하여 재렌더링, 또는 goodsAll 재실행
      // goodsAll();
      setState(() {
        goodsList.add(data);
      });
    } catch(e) {
      print(e);
    }
  }

  void goodsAll() async {
    try {
      final dio = Dio();
      final response = await dio.get("http://192.168.40.187:8080/api/goods/list");
      final data = response.data;
      print(data);

      // 통신 결과를 함수 밖 변수에 업데이트 (재렌더링)
      setState(() {
        goodsList = data;
      });
    } catch(e) {
      print(e);
    }
  }

  // 위젯이 열렸을 때 최초 1번 실행
  @override
  void initState() {
    goodsAll();
  }

  // dio 로 가져온 데이터를 저장하는 상태 변수
  dynamic goodsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("제품 현황")),
      body: Padding(
          padding: EdgeInsets.all(20), // 안쪽 여백
          child: Column( // 세로(column), 가로(row) 정렬
            children: [
              TextField(decoration: InputDecoration(labelText: "제품명"),
                controller: nameCont,
              ), // Input
                SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: "제품가격"),
                keyboardType: TextInputType.number, // 모바일 환경에서 숫자 패드 표시
                controller: priceCont,
              ),
                SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: "제품설명"),
                controller: descCont,
              ),
                SizedBox(height: 50),
              ElevatedButton(onPressed: goodsSave, child: Text("제품등록")), // Button

              SizedBox(height: 100),
              Expanded(child: ListView.builder(
                  itemCount: goodsList.length, // List 의 총 개수 정의
                  itemBuilder: (context, index) {
                    dynamic goods = goodsList[index];
                    return Card(child: ListTile(
                      title: Text(goods['gname']),
                      subtitle: Text(goods['gdesc'])
                    ));
                  })
              )
            ],
          )
      )
    );
  }
}
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page")),
      body: Center(
        child: Column(
          children: [
            Text("Body"),
            ElevatedButton(
                onPressed: (){
                  // 최근 위젯으로 돌아가기
                  Navigator.pop(context);
                },
                child: Text("Back")
            )
          ],
        )
      )
    );
  }
}
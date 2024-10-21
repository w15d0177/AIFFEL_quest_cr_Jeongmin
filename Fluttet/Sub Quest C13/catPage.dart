import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CatPage extends StatelessWidget {
  bool is_cat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(FontAwesomeIcons.cat), // 아이콘 추가
            title: Text('First Page')), // 텍스트 추가
        body: Center(
          // 중앙 정렬
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 정중앙 정렬
            children: [
              ElevatedButton(
                  child: Text('Next'),
                  onPressed: () => (Navigator.pushNamed(context, '/dog',
                      arguments: is_cat =
                          false))), // is_cat을 false로 초기화 후 인자값 전달
              InkWell(
                onTap: () {
                  print('is_cat : $is_cat'); // true
                },
                child: Image.asset(
                  'images/yong.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ));
  }
}

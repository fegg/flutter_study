import 'package:data_test/route/tip_route.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RouteTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final word = WordPair.random();
          Navigator.of(context).pushNamed("new_page", arguments: word.toString());
          // var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return TipRoute(text: "我是提示内容");
          // }));
          //
          // print("路由返回值: $result");
        },
        child: const Text("打开提示页面"),
      ),
    );
  }

}
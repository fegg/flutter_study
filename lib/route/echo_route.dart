import 'package:flutter/material.dart';

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context)?.settings.arguments;
    //...省略无关代码

    return Center(
      child: Text("echo route $args"),
    );
  }
}
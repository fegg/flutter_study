import 'package:flutter/material.dart';

class FittedRoute extends StatelessWidget {
  static String testText = " 90000000000000000 ";

  const FittedRoute({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试 FittedBox"),
      ),
      body: Center(
        child: Column(
          children: [
            wRow(testText),
            FittedBox(
              child: wRow(testText),
            ),
            wRow(" 800 "),
            FittedBox(
              child: wRow(" 800 "),
            ),
          ]
              .map((e) =>
              Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: e))
              .toList(),
        ),
      ),
    );
  }

  Widget wRow(String text) {
    Widget child = Text(text);

    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );

    return child;
  }
}

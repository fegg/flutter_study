import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatefulWidget {
  const FlexLayoutTestRoute({Key? key}) : super(key: key);

  @override
  _FlexLayoutTestRouteState createState() => _FlexLayoutTestRouteState();
}

class _FlexLayoutTestRouteState extends State<FlexLayoutTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹性布局"),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: const <Widget>[
              Expanded(
                flex: 1,
                child: const Text("左侧文本"),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: const Text("中间文本"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 100,
              child: Flex(
                direction: Axis.vertical,
                children: const <Widget>[
                  Expanded(
                    flex: 2,
                    child: const Text("上面文本"),
                  ),
                  Expanded(
                    flex: 1,
                    child: const Text("下面文本"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  const FocusTestRoute({super.key});

  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  late bool _active = false;

  _handleTapInput1() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    var borderColor = _active ? Colors.red : Colors.grey;

    return Scaffold(
        appBar: AppBar(
          title: const Text("焦点测试"),
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200],
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              hintStyle: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: borderColor, width: 1.0),
                  ),
                ),
                child: TextField(
                  onTap: _handleTapInput1,
                  autofocus: true,
                  focusNode: focusNode1,
                  decoration: InputDecoration(
                    labelText: _active ? "input1 active" : "input1",
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none,
                    // enabledBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.green),
                    // ),
                    // focusedBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.lightBlue),
                    // ),
                  ),
                ),
              ),
              TextField(
                focusNode: focusNode2,
                decoration: const InputDecoration(
                  labelText: "input2",
                ),
              ),
              Builder(builder: (ctx) {
                return Column(
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text("测试焦点"),
                      onPressed: () {
                        focusScopeNode ??= FocusScope.of(context);
                        focusScopeNode?.requestFocus(focusNode2);
                      },
                    ),
                    ElevatedButton(
                      child: const Text("隐藏键盘"),
                      onPressed: () {
                        // 当所有编辑框都失去焦点时键盘就会收起
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    ),
                  ],
                );
              })
            ],
          ),
        ),
    );
  }
}

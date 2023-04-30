import 'package:data_test/components/process_test_route.dart';
import 'package:data_test/form/form_test_route.dart';
import 'package:data_test/route/scaffold_route.dart';
import 'package:flutter/material.dart';

import 'components/flex_layout_test_route.dart';
import 'form/focus_test_route.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FocusTestRoute();
              }),
            );
          },
          child: const Text("表单测试焦点"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FormTestRoute();
              }),
            );
          },
          child: const Text("表单校验测试"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ProcessTestRoute();
              }),
            );
          },
          child: const Text("ProcessTestRoute"),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const FlexLayoutTestRoute();
                }),
              );
            },
            child: const Text("FlexLayoutTestRoute")),
        SizedBox(
            width: 100,
            height: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScaffoldRoute();
                }));
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.red, Colors.orange.shade700]),
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        )
      ],
    );
  }
}

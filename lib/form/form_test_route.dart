import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("表单校验"),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _unameController,
              decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "用户名或者邮箱",
                icon: Icon(Icons.person),
              ),
              validator: (v) {
                return v!.trim().isNotEmpty ? null : '用户名不能为空';
              },
            ),
            TextFormField(
              controller: _pwdController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "密码",
                hintText: "请输入登录密码",
                icon: Icon(Icons.lock),
              ),
              validator: (v) {
                return v!.trim().length > 5 ? null : "密码不能少于 6 位";
              },
            ),

            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: ElevatedButton(
                    onPressed: () {
                      var currentState = _formKey.currentState as FormState;
                      if (currentState.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text that the user has entered by using the
                              // TextEditingController.
                              content: Text(_unameController.text),
                            );
                          },
                        );
                      }
                    },
                    child: const Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('登录'),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

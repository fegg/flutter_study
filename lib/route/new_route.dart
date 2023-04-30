import 'package:data_test/route/route_test.dart';
import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: Center(
        child: RouteTest(),
      ),
    );
  }
}
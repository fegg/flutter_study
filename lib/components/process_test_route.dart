import 'package:flutter/material.dart';

class ProcessTestRoute extends StatefulWidget {
  const ProcessTestRoute({Key? key}) : super(key: key);

  @override
  _ProcessTestRouteState createState() => _ProcessTestRouteState();
}

class _ProcessTestRouteState extends State<ProcessTestRoute>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animationController?.forward();
    _animationController?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条测试"),
        actions: const [
          Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: [
              LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  value: _animationController?.value,
                  valueColor: _animationController != null
                      ? ColorTween(begin: Colors.grey, end: Colors.blue)
                          .animate(_animationController as Animation<double>)
                      : const AlwaysStoppedAnimation(Colors.blue)),
              // Padding(
              //   padding: EdgeInsets.only(top: 20.0),
              //   child: CircularProgressIndicator(
              //     backgroundColor: Colors.grey[200],
              //     valueColor: const AlwaysStoppedAnimation(Colors.lightBlue),
              //   ),
              // ),
              // SizedBox(
              //   height: 3,
              //   child: LinearProgressIndicator(
              //     backgroundColor: Colors.grey[200],
              //     valueColor: const AlwaysStoppedAnimation(Colors.blue),
              //   ),
              // ),
              // SizedBox(
              //   width: 100,
              //   height: 100,
              //   child: CircularProgressIndicator(
              //     strokeWidth: 10,
              //     backgroundColor: Colors.grey[200],
              //     valueColor: const AlwaysStoppedAnimation(Colors.blue),
              //   ),
              // )
            ],
          )),
    );
  }
}

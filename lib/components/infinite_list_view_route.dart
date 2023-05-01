import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class InfiniteListViewRoute extends StatefulWidget {
  const InfiniteListViewRoute({Key? key}) : super(key: key);

  @override
  _InfiniteListViewRouteState createState() => _InfiniteListViewRouteState();
}

class _InfiniteListViewRouteState extends State<InfiniteListViewRoute> {
  static const loadingTag = "LoadingEnd";

  final _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("无限加载列表"),
      ),
      body: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retrieveData();

              return Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0.5,
            color: Colors.grey,
          );
        },
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}

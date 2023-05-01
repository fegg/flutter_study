import 'package:flutter/material.dart';

class ListViewControllerRoute extends StatefulWidget {
  @override
  _ListViewControllerRouteState createState() =>
      _ListViewControllerRouteState();
}

class _ListViewControllerRouteState extends State<ListViewControllerRoute> {
  final ScrollController _scrollController = ScrollController();

  bool _showToTopBtn = false;
  int _offset = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset.toInt();
      });

      if (_scrollController.offset < 1000 && _showToTopBtn) {
        setState(() {
          _showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && !_showToTopBtn) {
        setState(() {
          _showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_offset.toString()),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
            );
          },
        ),
      ),
      floatingActionButton: !_showToTopBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }
}

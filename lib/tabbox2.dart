import 'package:data_test/route/new_route.dart';
import 'package:flutter/material.dart';

class Tabbox2 extends StatefulWidget {
  Tabbox2({ Key? key, this.active: false, required this.onChanged })
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _Tabbox2State createState() => _Tabbox2State();
}

class _Tabbox2State extends State<Tabbox2> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const NewRoute();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(
            color: Colors.teal,
            width: 10,
          ) : null,
        ),
        child: Center(
          child: Text(
            widget.active ? 'active' : 'inActive',
            style: TextStyle(fontSize: 32, color: Color.fromRGBO(255, 255, 255, 1)),
          ),
        ),
      ),
    );
  }
}
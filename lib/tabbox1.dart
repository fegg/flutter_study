import 'package:flutter/material.dart';

class Tabbox1 extends StatelessWidget {
  const Tabbox1({ Key? key, this.active: false, required this.onChanged }): super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? const Color.fromRGBO(0, 0, 0, .8) : const Color.fromRGBO(9, 9, 9, .7),
        ),
        child: Center(
          child: Text(
            active ? 'active' : 'inActive',
            style: const TextStyle(fontSize: 32.0, color: Color.fromRGBO(255, 255, 255, 1)),
          ),
        ),
      )
    );
  }
}

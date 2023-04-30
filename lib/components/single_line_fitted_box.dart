import 'package:flutter/material.dart';

class SingleLineFittedBox extends StatelessWidget {
  final Widget child;

  const SingleLineFittedBox({ Key? key, required this.child }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) =>
          FittedBox(
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                // minWidth: constraints.maxWidth,
                maxWidth: constraints.maxWidth,
              ),
              child: child,
            )
          ),
    );
  }
}
import 'package:flutter/material.dart';

class RotationYTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> rotationY;

  const RotationYTransition({Key? key, required this.child, required this.rotationY}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final angle = rotationY.value * 3.14;
    return Transform(
      transform: Matrix4.rotationY(angle),
      alignment: Alignment.center,
      child: child,
    );
  }
}
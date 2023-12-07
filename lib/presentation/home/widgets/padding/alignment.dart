import 'package:flutter/material.dart';

class Placement extends StatelessWidget {
   final double translateX;
  final double translateY;
  final Widget child;

  const Placement({ Key? key, required this.translateX, required this.translateY, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(translateX, translateY),
      child: child,

    );
  }
}
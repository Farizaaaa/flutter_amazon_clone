import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final double dimention;

  const CustomSquareButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.color,
      required this.dimention});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: dimention,
        width: dimention,
        decoration: ShapeDecoration(
          color: color,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(2))),
        child: Center(child: child),
      ),
    );
  }
}

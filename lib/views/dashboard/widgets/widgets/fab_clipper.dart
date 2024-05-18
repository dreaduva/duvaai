import 'package:flutter/material.dart';

class FabClipper extends CustomClipper<Path> {
  final double notchRadius;

  FabClipper({required this.notchRadius});

  @override
  Path getClip(Size size) {
    final double notchCenterX = size.width / 2;
    final double notchCenterY = 0;

    final Path path = Path()
      ..lineTo(notchCenterX - notchRadius * 1.5, notchCenterY)
      ..arcToPoint(
        Offset(notchCenterX + notchRadius * 1.5, notchCenterY),
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

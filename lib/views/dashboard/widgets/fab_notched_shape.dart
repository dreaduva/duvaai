import 'package:flutter/material.dart';

class FabNotchedShape extends CircularNotchedRectangle {
  final double fabRadius;

  FabNotchedShape({required this.fabRadius});

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final notchPath = super.getOuterPath(host, guest);
    if (guest == null) {
      return notchPath;
    }

    final fabX = guest.center.dx;
    final fabY = guest.center.dy;

    final notchWidth = fabRadius * 1.5;
    final notchDepth = fabRadius / 2;

    return Path.combine(
      PathOperation.difference,
      notchPath,
      Path()
        ..moveTo(fabX - notchWidth, host.top)
        ..quadraticBezierTo(
            fabX, host.top - notchDepth, fabX + notchWidth, host.top)
        ..lineTo(fabX + notchWidth, host.top)
        ..close(),
    );
  }
}

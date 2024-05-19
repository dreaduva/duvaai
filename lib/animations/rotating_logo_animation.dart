import 'package:flutter/material.dart';

class RotatingLogoAnimation extends StatefulWidget {
  final Widget child;

  const RotatingLogoAnimation({required this.child});

  @override
  _RotatingLogoAnimationState createState() => _RotatingLogoAnimationState();
}

class _RotatingLogoAnimationState extends State<RotatingLogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}

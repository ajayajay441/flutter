// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/pages/loader/spinner.dart';

class Loader extends StatefulWidget {
  final VoidCallback onLoadEnd; // Define a callback function
  const Loader({super.key, required this.onLoadEnd});

  void _onLoadEnd() {
    onLoadEnd();
  }

  @override
  _RotatingArcWithCircleState createState() => _RotatingArcWithCircleState();
}

class _RotatingArcWithCircleState extends State<Loader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.repeat();
    Timer(const Duration(seconds: 1), () {
      _controller.stop();
      widget._onLoadEnd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: FullCircleWithGradientPainter(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

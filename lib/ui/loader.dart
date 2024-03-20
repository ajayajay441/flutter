// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

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
      duration: const Duration(seconds: 1), // Rotate for 2 seconds
    );
    _controller.repeat(reverse: true);
    Timer(const Duration(seconds: 1), () {
      _controller.stop();
      runApp(const MaterialApp(
        home: MyHomePage(), // New root route
      ));
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

class FullCircleWithGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 52;
    double strokeWidth = 8;
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Define gradient for top arc
    Paint arcPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = const LinearGradient(
        colors: [Colors.white, Color(0xFFA0642F)],
        begin: Alignment.topCenter, // Start of gradient at top center
        end: Alignment.bottomCenter, // End of gradient at bottom center
      ).createShader(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    // Draw top arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -pi / 2, // Start angle
      pi, // Sweep angle (180 degrees)
      false,
      arcPaint,
    );

    // Define gradient for bottom arc
    Paint bottomArcPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = const LinearGradient(
        colors: [Colors.white, Color(0xFFA0642F)],
        begin: Alignment.bottomCenter, // Start of gradient at bottom center
        end: Alignment.topCenter, // End of gradient at top center
      ).createShader(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    // Draw bottom arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      pi / 2, // Start angle
      pi, // Sweep angle (180 degrees)
      false,
      bottomArcPaint,
    );

    // Draw circle at end of bottom arc
    double endCircleX = centerX + radius * cos(pi / 2); // End angle
    double endCircleY = centerY + radius * sin(pi / 2); // End angle
    Paint endCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFA0642F);
    canvas.drawCircle(Offset(endCircleX, endCircleY), 4, endCirclePaint);

    // Draw circle at start of top arc
    double startCircleX = centerX + radius * cos(-pi / 2); // Start angle
    double startCircleY = centerY + radius * sin(-pi / 2); // Start angle
    Paint startCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFA0642F);
    canvas.drawCircle(Offset(startCircleX, startCircleY), 4, startCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

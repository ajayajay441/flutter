import 'dart:math';

import 'package:flutter/material.dart';

class FullCircleWithGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 52;
    double strokeWidth = 16;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    const int spinnerColor = 0xFFE8A707;
    // Define gradient for top arc
    Paint arcPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = const LinearGradient(
        colors: [Colors.white, Color(spinnerColor)],
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
        colors: [Colors.white, Color(spinnerColor)],
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
      ..color = const Color(spinnerColor);
    canvas.drawCircle(Offset(endCircleX, endCircleY), 8, endCirclePaint);

    // Draw circle at start of top arc
    double startCircleX = centerX + radius * cos(-pi / 2); // Start angle
    double startCircleY = centerY + radius * sin(-pi / 2); // Start angle
    Paint startCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(spinnerColor);
    canvas.drawCircle(Offset(startCircleX, startCircleY), 8, startCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

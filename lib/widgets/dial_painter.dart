// Custom Painter for the Dial
import 'dart:math';

import 'package:flutter/material.dart';

class DialPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  DialPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2.5;
    final strokeWidth = 15.0;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );

    // Draw handle
    final handlePaint = Paint()
      ..color = const Color.fromARGB(255, 228, 150, 121)
      
      ..style = PaintingStyle.fill;

    final handleAngle = 2 * pi * progress - pi / 2;
    final handleCenter = Offset(
      center.dx + radius * cos(handleAngle),
      center.dy + radius * sin(handleAngle),
    );
     final handlePaintOverlay = Paint()
      ..color = const Color.fromARGB(255, 36, 36, 36)
      ..style = PaintingStyle.fill;
   final handlePaintOverlayLine = Paint()
      ..color = const Color.fromARGB(255, 8, 190, 32)
      ..style = PaintingStyle.fill;
     const lineLength = 14.0; // Length of the line
    final lineStart = Offset(
      handleCenter.dx - (lineLength / 2) * cos(handleAngle),
      handleCenter.dy - (lineLength / 2) * sin(handleAngle)
    );
    final lineEnd = Offset(
      handleCenter.dx + (lineLength / 2) * cos(handleAngle),
      handleCenter.dy + (lineLength / 2) * sin(handleAngle)
    );
    //Handle of progress indicator
    canvas.drawCircle(handleCenter, 15, handlePaint);
        canvas.drawCircle(handleCenter, 11, handlePaintOverlay);
        canvas.drawLine(lineStart, lineEnd, handlePaintOverlayLine);
  }


  @override
  bool shouldRepaint(DialPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        backgroundColor != oldDelegate.backgroundColor ||
        progressColor != oldDelegate.progressColor;
  }
}
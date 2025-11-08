import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final wavePaint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final path1 = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.2,
        size.width * 0.5,
        size.height * 0.3,
      )
      ..quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.4,
        size.width,
        size.height * 0.35,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path1, wavePaint);

    final path2 = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.65,
        size.width * 0.6,
        size.height * 0.8,
      )
      ..quadraticBezierTo(
        size.width * 0.85,
        size.height * 0.95,
        size.width,
        size.height * 0.85,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path2, wavePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

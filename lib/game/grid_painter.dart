import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final double wd;
  final double he;
  GridPainter(this.wd, this.he);
  var si = 0.0;
  @override
  void paint(Canvas canvas, Size size) {
    if (wd < 360) {
      si = wd / 16.0;
    } else {
      si = 360 / 16;
    }
    canvas.save();
    canvas.translate((-wd / 2) + (wd - 360) / 2 + 10, 0);
    for (var i = 0; i < 24; i++) {
      canvas.drawLine(Offset(0, i * si), Offset(16 * si - si, i * si),
          Paint()..color = Colors.black);
    }
    for (var i = 0; i < 16; i++) {
      canvas.drawLine(Offset(i * si, 0), Offset(i * si, 24 * si - si),
          Paint()..color = Colors.black);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

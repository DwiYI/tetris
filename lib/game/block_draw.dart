import 'package:flutter/material.dart';

class BlockDraw {
  final int x;
  final int y;
  final Color color;

  BlockDraw({required this.x, required this.y, required this.color});
  double size = 0;

  void paint(Canvas canvas, double width, double height) {
    if (width < 360) {
      size = width / 16.0;
    } else {
      size = 360 / 16;
    }
    //print('$x $y');
    canvas.save();
    canvas.translate((-width / 2) + (width - 360) / 2 + 10, 0);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset((size / 2) * (x * 2 + 1), size / 2 * (y * 2 + 1)),
            width: size,
            height: size),
        Paint()..color = color);
    canvas.restore();
  }
}

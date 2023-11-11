import 'package:flutter/material.dart';
import 'package:tetris/game/draw_piece.dart';

class PieceImpl implements DrawPiece {
  final int x;
  final int y;

  PieceImpl({
    required this.x,
    required this.y,
  });
  double size = 0;

  @override
  void paint(Canvas canvas, double width, double height) {
    if (width < 360) {
      size = width / 16.0;
    } else {
      size = 360 / 16;
    }
    print('$x $y');
    canvas.save();
    canvas.translate((-width / 2) + (width - 360) / 2 + 10, 0);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset((size / 2) * (x * 2 + 1), size / 2 * (y * 2 + 1)),
            width: size,
            height: size),
        Paint()..color = Colors.red);
    canvas.restore();
  }
}

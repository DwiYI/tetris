import 'package:flutter/material.dart';
import 'package:tetris/game/piece.dart';

class GamePainter extends CustomPainter {
  final double width;
  final double height;
  final List<Piece> pieces;

  GamePainter(
      {required this.width, required this.height, required this.pieces});

  @override
  void paint(Canvas canvas, Size size) {
    // if (wd < 360) {
    //   si = wd / 16.0;
    // } else {
    //   si = 360 / 16;
    // }
    // canvas.save();
    // canvas.translate((-wd / 2) + (wd - 360) / 2 + 10, 0);
    // canvas.drawRect(
    //     Rect.fromCenter(center: Offset(si / 2, si / 2), width: si, height: si),
    //     Paint()..color = Colors.red);
    // canvas.restore();

    canvas.save();
    for (var i = 0; i < pieces.length; i++) {
      for (var j = 0; j < pieces[i].drawPieces.length; j++) {
        pieces[i].drawPieces[j].paint(canvas, width, height);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

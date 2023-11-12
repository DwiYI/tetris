import 'package:flutter/material.dart';
import 'package:tetris/game/block_draw.dart';
import 'package:tetris/game/piece_impl.dart';

class BoardPainter extends CustomPainter {
  final List<List<bool>> board;
  final double width;
  final double height;
  BoardPainter(
      {required this.board, required this.width, required this.height});
  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board[i].length; j++) {
        if (board[i][j]) {
          BlockDraw(x: i, y: j, color: Colors.purpleAccent)
              .paint(canvas, width, height);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

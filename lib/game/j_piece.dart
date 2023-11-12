import 'package:flutter/material.dart';
import 'package:tetris/game/piece.dart';
import 'package:tetris/game/piece_impl.dart';

class JPiece extends Piece {
  final int x;
  final int y;
  JPiece({
    this.x = 0,
    this.y = 0,
  }) : super(
          drawPieces: [
            PieceImpl(x: 0, y: 0),
            PieceImpl(x: 0, y: 1),
            PieceImpl(x: 1, y: 1),
            PieceImpl(x: 2, y: 1),
          ],
          isActive: true,
        );
  var rotateKind = 0;

  @override
  void rotate() {
    var _temp = <PieceImpl>[];
    switch (rotateKind % 4) {
      case 0:
        _temp = [
          PieceImpl(
              x: drawPieces[0].x + 1, y: drawPieces[0].y, color: Colors.black),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y - 1),
          PieceImpl(x: drawPieces[2].x - 1, y: drawPieces[2].y),
          PieceImpl(x: drawPieces[3].x - 2, y: drawPieces[3].y + 1),
        ];

        break;
      case 1:
        _temp = [
          PieceImpl(
              x: drawPieces[0].x - 1,
              y: drawPieces[0].y + 1,
              color: Colors.black),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x - 1, y: drawPieces[2].y - 1),
          PieceImpl(x: drawPieces[3].x - 2, y: drawPieces[3].y - 2),
        ];
        break;
      case 2:
        _temp = [
          PieceImpl(
              x: drawPieces[0].x - 1,
              y: drawPieces[0].y - 1,
              color: Colors.red),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x + 1, y: drawPieces[2].y - 1),
          PieceImpl(x: drawPieces[3].x + 2, y: drawPieces[3].y - 2),
        ];
        break;
      case 3:
        _temp = [
          PieceImpl(
              x: drawPieces[0].x + 1, y: drawPieces[0].y, color: Colors.red),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y + 1),
          PieceImpl(x: drawPieces[2].x + 1, y: drawPieces[2].y + 2),
          PieceImpl(x: drawPieces[3].x + 2, y: drawPieces[3].y + 3),
        ];
        break;
      default:
    }

    if (checkCanNotRotate(_temp)) {
      drawPieces = _temp;
      rotateKind++;
    }
  }
}

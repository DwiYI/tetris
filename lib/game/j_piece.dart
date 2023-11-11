import 'package:tetris/game/piece.dart';
import 'package:tetris/game/piece_impl.dart';

class JPiece extends Piece {
  final int x;
  final int y;
  JPiece({this.x = 0, this.y = 0})
      : super(
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
  void moveLeft() {
    if (!checkNotInsideGridX(
        drawPieces.map((e) => PieceImpl(x: e.x - 1, y: e.y)).toList())) {
      drawPieces =
          drawPieces.map((e) => PieceImpl(x: e.x - 1, y: e.y)).toList();
    }
  }

  @override
  void moveRight() {
    if (!checkNotInsideGridX(
        drawPieces.map((e) => PieceImpl(x: e.x + 1, y: e.y)).toList())) {
      drawPieces =
          drawPieces.map((e) => PieceImpl(x: e.x + 1, y: e.y)).toList();
    }
  }

  bool checkNotInsideGridX(List<PieceImpl> val) {
    return val.any((element) => element.x < 0 || element.x > 14);
  }

  @override
  void rotate() {
    switch (rotateKind % 4) {
      case 0:
        drawPieces = [
          PieceImpl(x: drawPieces[0].x + 1, y: drawPieces[0].y),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y - 1),
          PieceImpl(x: drawPieces[2].x - 1, y: drawPieces[2].y),
          PieceImpl(x: drawPieces[3].x - 2, y: drawPieces[3].y + 1),
        ];

        break;
      case 1:
        drawPieces = [
          PieceImpl(x: drawPieces[0].x - 2, y: drawPieces[0].y + 2),
          PieceImpl(x: drawPieces[1].x - 1, y: drawPieces[1].y + 1),
          PieceImpl(x: drawPieces[2].x, y: drawPieces[2].y),
          PieceImpl(x: drawPieces[3].x + 1, y: drawPieces[3].y - 1),
        ];
        break;
      case 2:
        drawPieces = [
          PieceImpl(x: drawPieces[0].x - 1, y: drawPieces[0].y + 1),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x - 1, y: drawPieces[2].y - 1),
          PieceImpl(x: drawPieces[3].x - 2, y: drawPieces[3].y - 2),
        ];
        break;
      default:
    }
    rotateKind++;
  }
}

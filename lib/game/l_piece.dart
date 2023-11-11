import 'package:tetris/game/piece.dart';
import 'package:tetris/game/piece_impl.dart';

class LPiece extends Piece {
  final int x;
  final int y;
  LPiece({this.x = 0, this.y = 0})
      : super(
          drawPieces: [
            PieceImpl(x: 0, y: 0),
            PieceImpl(x: 1, y: 0),
            PieceImpl(x: 2, y: 0),
            PieceImpl(x: 3, y: 0),
          ],
          isActive: true,
        );

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
}

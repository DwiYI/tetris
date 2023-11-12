import 'package:tetris/game/piece_impl.dart';

abstract class Piece {
  bool isActive;
  List<PieceImpl> drawPieces;
  Piece({
    required this.drawPieces,
    this.isActive = false,
  });

  void moveLeft(List<Piece> val) {
    if (!checkIsOverlapWithOtherPieces(
            drawPieces.map((e) => PieceImpl(x: e.x - 1, y: e.y)).toList(),
            val) &&
        !checkNotInsideGridX(
            drawPieces.map((e) => PieceImpl(x: e.x - 1, y: e.y)).toList())) {
      drawPieces =
          drawPieces.map((e) => PieceImpl(x: e.x - 1, y: e.y)).toList();
    }
  }

  void moveRight(List<Piece> val) {
    if (!checkIsOverlapWithOtherPieces(
            drawPieces.map((e) => PieceImpl(x: e.x + 1, y: e.y)).toList(),
            val) &&
        !checkNotInsideGridX(
            drawPieces.map((e) => PieceImpl(x: e.x + 1, y: e.y)).toList())) {
      drawPieces =
          drawPieces.map((e) => PieceImpl(x: e.x + 1, y: e.y)).toList();
    }
  }

  bool checkNotInsideGridX(List<PieceImpl> val) {
    return val.any((element) => element.x < 0 || element.x > 14);
  }

  bool checkNotInsideGridY(List<PieceImpl> val) {
    return val.any((element) => element.y > 22);
  }

  bool checkCanNotRotate(List<PieceImpl> val) =>
      !checkNotInsideGridX(val) && !checkNotInsideGridY(val);

  void moveDown(List<Piece> val, void Function() spawn) {
    if (!checkIsOverlapWithOtherPieces(
            drawPieces.map((e) => PieceImpl(x: e.x, y: e.y + 1)).toList(),
            val) &&
        !checkOnGround(val) &&
        !checkNotInsideGridY(
            drawPieces.map((e) => PieceImpl(x: e.x, y: e.y + 1)).toList())) {
      drawPieces =
          drawPieces.map((e) => PieceImpl(x: e.x, y: e.y + 1)).toList();
    } else {
      isActive = false;
      spawn.call();
    }
  }

  bool checkOnGround(List<Piece> val) {
    return drawPieces
        .map((e) => PieceImpl(x: e.x, y: e.y + 1))
        .toList()
        .any((element) => element.y == 23);
  }

  bool checkIsOverlapWithOtherPieces(List<PieceImpl> val1, List<Piece> pieces) {
    return val1.any((element) => pieces
        .toPassivePieces()
        .any((el) => el.y == element.y && el.x == element.x));
  }

  void rotate();
}

extension Ah on List<Piece> {
  List<PieceImpl> toPassivePieces() {
    return where((element) => element.isActive == false)
        .map((e) => e.drawPieces)
        .expand((element) => element)
        .toList();
  }

  void removeBy(int y) {
    for (var i = 0; i < length; i++) {
      this[i].drawPieces.removeWhere((element) => element.y == y);
    }
  }

  void moveBy(int y) {
    for (var i = 0; i < length; i++) {
      this[i].drawPieces = this[i]
          .drawPieces
          .map((e) => PieceImpl(x: e.x, y: e.y < y ? e.y + 1 : e.y))
          .toList();
    }
  }
}

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
    //print(pieces.where((element) => element.isActive == false).toList().length);
    bool isOverlap = false;
    // for (var i = 0; i < pieces.length; i++) {
    //   if (pieces[i].isActive == false) {
    //     //print('${pieces[i].drawPieces}');
    //     print('object');
    //     print('${val1}');
    //     //check overlap
    //     isOverlap = pieces[i].drawPieces.any((element) =>
    //         val1.any((currEle) => element.x == currEle.x) ||
    //         val1.any((currEle) => element.y == currEle.y));
    //   }
    // }
    //print(pieces.toPassivePieces().any((el) => el.y == 0));
    print(val1.any(
        (element) => pieces.toPassivePieces().any((el) => el.y == element.y)));
    return val1.any((element) => pieces
        .toPassivePieces()
        .any((el) => el.y == element.y && el.x == element.x));
  }

  void rotate();
}

extension ah on List<Piece> {
  List<PieceImpl> toPassivePieces() {
    return where((element) => element.isActive == false)
        .map((e) => e.drawPieces)
        .expand((element) => element)
        .toList();
  }
}

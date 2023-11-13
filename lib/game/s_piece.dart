import 'package:tetris/game/piece.dart';
import 'package:tetris/game/piece_impl.dart';

class SPiece extends Piece {
  final int x;
  final int y;
  SPiece({
    this.x = 0,
    this.y = 0,
  }) : super(
          drawPieces: [
            PieceImpl(x: 0 + x, y: 1 + y),
            PieceImpl(x: 1 + x, y: 1 + y),
            PieceImpl(x: 1 + x, y: 0 + y),
            PieceImpl(x: 2 + x, y: 0 + y),
          ],
          isActive: true,
        );
  var rotateKind = 0;

  @override
  void rotate() {
    var temp = <PieceImpl>[];
    switch (rotateKind % 2) {
      case 0:
        temp = [
          PieceImpl(x: drawPieces[0].x, y: drawPieces[0].y - 1),
          PieceImpl(x: drawPieces[1].x - 1, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x, y: drawPieces[2].y + 1),
          PieceImpl(x: drawPieces[3].x - 1, y: drawPieces[3].y + 2),
        ];

        break;

      case 1:
        temp = [
          PieceImpl(x: drawPieces[0].x, y: drawPieces[0].y + 1),
          PieceImpl(x: drawPieces[1].x + 1, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x, y: drawPieces[2].y - 1),
          PieceImpl(x: drawPieces[3].x + 1, y: drawPieces[3].y - 2),
        ];
        break;
      default:
    }

    if (checkCanNotRotate(temp)) {
      drawPieces = temp;
      rotateKind++;
    }
  }
}

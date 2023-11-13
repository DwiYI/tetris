import 'package:tetris/game/piece.dart';
import 'package:tetris/game/piece_impl.dart';

class TPiece extends Piece {
  final int x;
  final int y;
  TPiece({
    this.x = 0,
    this.y = 0,
  }) : super(
          drawPieces: [
            PieceImpl(x: 0 + x, y: 1 + y),
            PieceImpl(x: 1 + x, y: 1 + y),
            PieceImpl(x: 1 + x, y: 0 + y),
            PieceImpl(x: 2 + x, y: 1 + y),
          ],
          isActive: true,
        );
  var rotateKind = 0;

  @override
  void rotate() {
    var temp = <PieceImpl>[];
    switch (rotateKind % 4) {
      case 0:
        temp = [
          PieceImpl(x: drawPieces[0].x + 1, y: drawPieces[0].y - 1),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x + 1, y: drawPieces[2].y + 1),
          PieceImpl(x: drawPieces[3].x - 1, y: drawPieces[3].y + 1),
        ];

        break;
      case 1:
        temp = [
          PieceImpl(x: drawPieces[0].x + 1, y: drawPieces[0].y + 1),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x - 1, y: drawPieces[2].y + 1),
          PieceImpl(x: drawPieces[3].x - 1, y: drawPieces[3].y - 1),
        ];
        break;
      case 2:
        temp = [
          PieceImpl(x: drawPieces[0].x - 1, y: drawPieces[0].y + 1),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x - 1, y: drawPieces[2].y - 1),
          PieceImpl(x: drawPieces[3].x + 1, y: drawPieces[3].y - 1),
        ];
        break;
      case 3:
        temp = [
          PieceImpl(x: drawPieces[0].x - 1, y: drawPieces[0].y - 1),
          PieceImpl(x: drawPieces[1].x, y: drawPieces[1].y),
          PieceImpl(x: drawPieces[2].x + 1, y: drawPieces[2].y - 1),
          PieceImpl(x: drawPieces[3].x + 1, y: drawPieces[3].y + 1),
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

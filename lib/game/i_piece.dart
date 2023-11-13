import 'package:tetris/game/piece.dart';
import 'package:tetris/game/piece_impl.dart';

class IPiece extends Piece {
  final int x;
  final int y;
  IPiece({
    this.x = 0,
    this.y = 0,
  }) : super(
          drawPieces: [
            PieceImpl(x: 0 + x, y: 0 + y),
            PieceImpl(x: 1 + x, y: 0 + y),
            PieceImpl(x: 2 + x, y: 0 + y),
            PieceImpl(x: 3 + x, y: 0 + y),
          ],
          isActive: true,
        );
  var rotateKind = 0;

  @override
  void rotate() {
    switch (rotateKind % 2) {
      case 0:
        drawPieces = [
          PieceImpl(x: drawPieces[0].x + 2, y: drawPieces[0].y - 2),
          PieceImpl(x: drawPieces[1].x + 1, y: drawPieces[1].y - 1),
          PieceImpl(x: drawPieces[2].x, y: drawPieces[2].y),
          PieceImpl(x: drawPieces[3].x - 1, y: drawPieces[3].y + 1),
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
      default:
    }
    rotateKind++;
  }
}

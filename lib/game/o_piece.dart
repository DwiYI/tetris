import 'package:tetris/game/piece.dart';
import 'package:tetris/game/piece_impl.dart';

class OPiece extends Piece {
  final int x;
  final int y;
  OPiece({
    this.x = 0,
    this.y = 0,
  }) : super(
          drawPieces: [
            PieceImpl(x: 0 + x, y: 0 + y),
            PieceImpl(x: 1 + x, y: 0 + y),
            PieceImpl(x: 0 + x, y: 1 + y),
            PieceImpl(x: 1 + x, y: 1 + y),
          ],
          isActive: true,
        );

  @override
  void rotate() {}
}

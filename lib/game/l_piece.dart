import 'package:tetris/game/piece.dart';
import 'package:tetris/game/piece_impl.dart';

class LPiece implements Piece {
  final int x;
  final int y;
  LPiece({required this.x, required this.y});

  @override
  List<PieceImpl> drawPieces = [
    PieceImpl(x: 0, y: 0),
    PieceImpl(x: 1, y: 0),
    PieceImpl(x: 2, y: 0),
    PieceImpl(x: 3, y: 0),
  ];
}

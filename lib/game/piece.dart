import 'package:tetris/game/piece_impl.dart';

abstract class Piece {
  bool isActive;
  List<PieceImpl> drawPieces;

  Piece({required this.drawPieces, this.isActive = false});

  void moveLeft();
  void moveRight();
  void flip();
}

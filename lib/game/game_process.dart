import 'package:flutter/material.dart';
import 'package:tetris/game/game_painter.dart';
import 'package:tetris/game/grid_painter.dart';
import 'package:tetris/game/piece.dart';

class GameProcess extends StatefulWidget {
  const GameProcess(
      {super.key,
      required this.maxWidth,
      required this.maxHeight,
      required this.pieces});
  final double maxHeight;
  final double maxWidth;
  final List<Piece> pieces;

  @override
  State<GameProcess> createState() => _GameProcessState();
}

class _GameProcessState extends State<GameProcess> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            CustomPaint(
              painter: GridPainter(widget.maxWidth, widget.maxHeight),
            ),
            CustomPaint(
              painter: GamePainter(
                  pieces: widget.pieces,
                  width: widget.maxWidth,
                  height: widget.maxHeight),
            ),
          ],
        ),
      ),
    );
  }
}

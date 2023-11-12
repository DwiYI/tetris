import 'package:flutter/material.dart';
import 'package:tetris/game/board_painter.dart';
import 'package:tetris/game/game_loop.dart';
import 'package:tetris/game/game_painter.dart';
import 'package:tetris/game/grid_painter.dart';
import 'package:tetris/game/l_piece.dart';
import 'package:tetris/game/piece.dart';

class GameProcess extends StatefulWidget {
  const GameProcess(
      {super.key,
      required this.maxWidth,
      required this.maxHeight,
      required this.pieces,
      this.isDrop = false});
  final double maxHeight;
  final double maxWidth;
  final List<Piece> pieces;
  final bool isDrop;

  @override
  State<GameProcess> createState() => _GameProcessState();
}

class _GameProcessState extends State<GameProcess> {
  late GameLoop gameLoop;

  List<List<bool>> board =
      List.generate(23, (index) => List.generate(15, (index) => false));

  void checkPieceInside() {
    // test on ground or toucheach other
    for (var i = 0; i < widget.pieces.length; i++) {
      if (widget.pieces[i].isActive) {
        // if (widget.pieces[i].checkOnGround(widget.pieces)) {
        //   widget.pieces.add(LPiece());
        //   isDrop = false;
        //   widget.pieces[i].isActive = false;
        // }
      }
    }
  }

  void spawn() {
    widget.pieces.add(LPiece());
  }

  bool isDrop = false;

  @override
  void initState() {
    super.initState();
    double time = 0;
    double period = 1;
    int i = 0;
    isDrop = widget.isDrop;
    gameLoop = GameLoop()
      ..start()
      ..update.stream.listen((dt) {
        time += dt;

        if (time >= (isDrop ? 0.05 : period)) {
          time = 0;

          // print('${i++} object');
          for (var i = 0; i < widget.pieces.length; i++) {
            if (widget.pieces[i].isActive) {
              widget.pieces[i].moveDown(widget.pieces, spawn);
            }
          }
          print('object');
          setState(() {});
          //checkPieceInside();
        }
      });
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

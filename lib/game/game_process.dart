import 'package:flutter/material.dart';
import 'package:tetris/game/board_painter.dart';
import 'package:tetris/game/game.dart';
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
      required this.controller,
      this.isDrop = false});
  final double maxHeight;
  final double maxWidth;
  final List<Piece> pieces;
  final bool isDrop;
  final GameProcessController controller;

  @override
  State<GameProcess> createState() => _GameProcessState();
}

class _GameProcessState extends State<GameProcess> {
  late GameLoop gameLoop;
  void checkIfCanRemoveLine() {
    var point = widget.pieces.toPassivePieces();

    var res = List.generate(23, (index) => 0);

    for (var i = 0; i <= 22; i++) {
      var dd = point.where((element) => element.y == i).toList();
      if (dd.isNotEmpty) {
        res[i] = dd.map((e) => e.x).reduce((value, element) => value + element);
        print(res[i]);
        if (res[i] == 105) {
          // delete this line
          print(i);
          widget.pieces.removeBy(i);
          widget.pieces.moveBy(i);
        }
      }
    }
  }

  void spawn() {
    checkIfCanRemoveLine();
    isDrop = false;
    widget.pieces.add(LPiece());
  }

  bool isDrop = false;

  void drop() {
    isDrop = true;
  }

  @override
  void initState() {
    super.initState();
    widget.controller.drop = drop;
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

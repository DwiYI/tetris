import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/game/game.dart';
import 'package:tetris/game/game_loop.dart';
import 'package:tetris/game/game_painter.dart';
import 'package:tetris/game/grid_painter.dart';
import 'package:tetris/game/j_piece.dart';
import 'package:tetris/game/i_piece.dart';
import 'package:tetris/game/l_piece.dart';
import 'package:tetris/game/o_piece.dart';
import 'package:tetris/game/piece.dart';
import 'package:tetris/game/s_piece.dart';
import 'package:tetris/game/t_piece.dart';
import 'package:tetris/game/z_piece.dart';

class GameProcess extends StatefulWidget {
  const GameProcess(
      {super.key,
      required this.maxWidth,
      required this.maxHeight,
      required this.pieces,
      required this.controller,
      required this.score,
      this.isDrop = false});
  final double maxHeight;
  final double maxWidth;
  final List<Piece> pieces;
  final bool isDrop;
  final GameProcessController controller;
  final Function(int) score;

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
        if (res[i] == 105) {
          // delete this line
          widget.pieces.removeBy(i);
          widget.pieces.moveBy(i);
          score += 10;
          widget.score(score);
        }
      }
    }
  }

  void spawn() {
    checkIfCanRemoveLine();
    isDrop = false;
    widget.pieces.add(generatePiece());
  }

  bool checkGameOver() {
    var po = widget.pieces.toPassivePieces();
    return po.any((element) => element.y < 0);
  }

  bool isDrop = false;

  void drop() {
    isDrop = true;
  }

  Piece generatePiece() {
    switch (randomBetween(0, 6)) {
      case 0:
        return IPiece(x: 5, y: -5);
      case 1:
        return JPiece(x: 5, y: -5);
      case 2:
        return LPiece(x: 5, y: -5);
      case 3:
        return OPiece(x: 5, y: -5);
      case 4:
        return SPiece(x: 5, y: -5);
      case 5:
        return TPiece(x: 5, y: -5);
      case 6:
        return ZPiece(x: 5, y: -5);
      default:
        throw 'not found';
    }
  }

  final _random = Random();
  int randomBetween(int min, int max) => min + _random.nextInt((max + 1) - min);
  int score = 0;
  @override
  void initState() {
    super.initState();
    widget.controller.drop = drop;
    double time = 0;
    double period = 1;
    isDrop = widget.isDrop;
    widget.pieces.add(generatePiece());
    gameLoop = GameLoop()
      ..start()
      ..update.stream.listen((dt) {
        time += dt;

        if (time >= (isDrop ? 0.05 : period)) {
          time = 0;

          for (var i = 0; i < widget.pieces.length; i++) {
            if (widget.pieces[i].isActive) {
              widget.pieces[i].moveDown(widget.pieces, spawn);
            }
          }
          if (checkGameOver()) {
            gameLoop.stop();
            showGameOver();
          }
          setState(() {});
        }
      });
  }

  void showGameOver() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Game Over'),
        content: Text('Score $score'),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
            child: const Text('Restart'),
          ),
        ],
      ),
    );
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

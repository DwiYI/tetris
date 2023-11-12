import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:tetris/game/game_process.dart';
import 'package:tetris/game/j_piece.dart';
import 'package:tetris/game/piece.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class GameProcessController {
  late void Function() drop;
}

class _GameState extends State<Game> {
  var pp = <Piece>[JPiece()];
  var isDrop = false;
  final GameProcessController myController = GameProcessController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints) => Column(
                  children: [
                    GameProcess(
                        pieces: pp,
                        isDrop: isDrop,
                        controller: myController,
                        maxWidth: constraints.maxWidth,
                        maxHeight: constraints.maxHeight),
                    Card(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        for (var i = 0; i < pp.length; i++) {
                                          if (pp[i].isActive) {
                                            setState(() {
                                              pp[i].moveLeft(pp);
                                            });
                                          }
                                        }
                                      },
                                      child: const Icon(
                                        AntDesign.caretleft,
                                      )),
                                ),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        for (var i = 0; i < pp.length; i++) {
                                          if (pp[i].isActive) {
                                            setState(() {
                                              pp[i].rotate();
                                            });
                                          }
                                        }
                                      },
                                      child: const Icon(
                                          Icons.flip_camera_android_outlined)),
                                ),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        for (var i = 0; i < pp.length; i++) {
                                          if (pp[i].isActive) {
                                            setState(() {
                                              pp[i].moveRight(pp);
                                            });
                                          }
                                        }
                                      },
                                      child: const Icon(
                                        AntDesign.caretright,
                                      )),
                                ),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          myController.drop();
                                        });
                                      },
                                      child: const Text('Drop')),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )));
  }
}

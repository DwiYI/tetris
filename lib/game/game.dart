import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:tetris/game/game_process.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints) => Column(
                  children: [
                    GameProcess(
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
                                      onPressed: () {},
                                      child: const Icon(
                                        AntDesign.caretleft,
                                      )),
                                ),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Icon(
                                          Icons.flip_camera_android_outlined)),
                                ),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Icon(
                                        AntDesign.caretright,
                                      )),
                                ),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ElevatedButton(
                                      onPressed: () {},
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

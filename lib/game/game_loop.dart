import 'dart:async';

import 'package:flutter/scheduler.dart';

class GameLoop {
  late Ticker _ticker;
  Duration _previous = Duration.zero;
  double accuTime = 0;
  double timeStep = 1.0 / 180.0;
  double dt = 0;
  StreamController<double> update = StreamController<double>.broadcast();
  GameLoop() {
    _ticker = Ticker(_tick);
  }
  void _tick(Duration timestamp) {
    final durationDelta = timestamp - _previous;
    dt = durationDelta.inMicroseconds / Duration.microsecondsPerSecond;
    _previous = timestamp;
    accuTime += dt;
    while (accuTime >= timeStep) {
      update.add(timeStep);
      accuTime -= timeStep;
    }
  }

  void stop() {
    _ticker.stop();
  }

  void start() {
    _ticker.start();
  }
}

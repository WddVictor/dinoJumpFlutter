import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'game_object.dart';

class GamePainter extends CustomPainter {
  final Set<GameObject> gameObjects;

  const GamePainter(this.gameObjects);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    for (var gameObject in gameObjects) {
      gameObject.render(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

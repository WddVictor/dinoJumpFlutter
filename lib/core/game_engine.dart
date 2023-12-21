import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/core/game_image_provider.dart';

import 'game_object.dart';
import 'game_painter.dart';

class GameEngine extends GetxController with GetSingleTickerProviderStateMixin {
  bool _initialized = false;

  bool get isInitialized => _initialized;

  final _gameObjects = <GameObject>{};

  Timer? _timer;

  Future<void> init({String? tag}) async {
    if (_initialized) {
      return;
    }
    _initialized = true;
    Get.put(GameImageProvider(), permanent: true, tag: tag);
    startGameLoop();
  }

  void addGameObject(GameObject gameObject) {
    _gameObjects.add(gameObject);
  }

  void removeGameObject(GameObject gameObject) {
    _gameObjects.remove(gameObject);
  }

  void updateGameObjects() {
    bool isDirty = false;
    for (var gameObject in _gameObjects.toList()) {
      gameObject.update();
      isDirty = isDirty || gameObject.isDirty;
    }
    if (isDirty) {
      update();
    }
  }

  void startGameLoop() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      updateGameObjects();
    });
  }

  Widget getView() {
    return CustomPaint(
      painter: GamePainter(_gameObjects),
    );
  }

  @override
  Future<void> dispose() async {
    _gameObjects.clear();
    _timer?.cancel();
    super.dispose();
  }
}

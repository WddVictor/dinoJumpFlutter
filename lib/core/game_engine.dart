import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/core/game_config.dart';
import 'package:getx_demo/core/game_image_provider.dart';

import 'game_object.dart';
import 'game_painter.dart';

class GameEngine extends GetxController with GetSingleTickerProviderStateMixin {
  bool _initialized = false;

  bool get isInitialized => _initialized;

  final _gameObjects = <GameObject>{};

  Timer? _timer;

  Future<void> init({GameConfig? config}) async {
    if (_initialized) {
      return;
    }
    _initialized = true;
    Get.put(
      GameImageProvider(),
      permanent: true,
    );
    Get.put(
      config ?? const GameConfig(),
      permanent: true,
    );
    startGameLoop();
  }

  void addGameObjects(List<GameObject> objects) {
    _gameObjects.addAll(objects);
  }

  void removeGameObject(GameObject gameObject) {
    gameObject.dispose();
    _gameObjects.remove(gameObject);
  }

  void removeAllGameObjects() {
    for (var object in _gameObjects) {
      object.dispose();
    }
    _gameObjects.clear();
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
    _timer = Timer.periodic(
        Duration(milliseconds: Get.find<GameConfig>().msPerFrame), (timer) {
      updateGameObjects();
    });
  }

  Widget getView() {
    return GetBuilder(
      init: this,
      builder: (_) => CustomPaint(
        painter: GamePainter(_gameObjects),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    _gameObjects.clear();
    _timer?.cancel();
    super.dispose();
  }
}

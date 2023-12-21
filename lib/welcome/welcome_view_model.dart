import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/core/game_engine.dart';
import 'package:getx_demo/core/game_image_provider.dart';
import 'package:getx_demo/dino_jump/dino_jump_constants.dart';
import 'package:getx_demo/dino_jump/dino_jump_page.dart';

enum Stage {
  initEngine,
  loadingAssets,
  ready,
}

class WelcomeViewModel extends GetxController {
  final Rx<Color> currentColor = const Color.fromARGB(255, 255, 0, 0).obs;
  final Rx<Stage> currentStage = Stage.initEngine.obs;

  bool get isReady => currentStage.value == Stage.ready;

  @override
  void onReady() {
    super.onReady();
    initStages();
  }

  void initStages() async {
    currentStage.value = Stage.initEngine;
    final gameEngine = GameEngine();
    Get.put(gameEngine, permanent: true);
    await gameEngine.init();
    await Future.delayed(const Duration(seconds: 1));
    currentStage.value = Stage.loadingAssets;
    final imageProvider = Get.find<GameImageProvider>();
    for (final imagePath in dinoJumpAssets.values) {
      await imageProvider.loadImage(imagePath);
    }
    await Future.delayed(const Duration(seconds: 1));
    currentStage.value = Stage.ready;
  }

  void start() async {
    await Get.offNamed(DinoJumpPage.routeName);
  }

  void changeColor() {
    currentColor.value = Color.fromARGB(
      255,
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
    );
  }
}

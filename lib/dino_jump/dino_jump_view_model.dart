import 'dart:ui';

import 'package:get/get.dart';
import 'package:getx_demo/core/game_engine.dart';
import 'package:getx_demo/dino_jump/objects/cactus_object.dart';

import 'dino_jump_constants.dart';
import 'objects/dino_object.dart';
import 'objects/ground_object.dart';

class DinoJumpViewModel extends GetxController {
  final currentStatus = DinoStatus.idle.obs;
  late final DinoObject dinoObject;
  late final List<GroundObject> grounds = [];
  final cacti = <CactusObject>[].obs;
  final cactusSpawnInterval = 2000;

  @override
  void onInit() {
    super.onInit();
    final gameEngine = Get.find<GameEngine>();
    dinoObject = DinoObject(
      rect: const Rect.fromLTWH(0, 300, 88, 94),
    );
    const double groundWidth = 2399;
    const double groundHeight = 24;
    grounds.addAll([
      GroundObject(
        rect: Rect.fromLTWH(0, dinoObject.rect.bottom - groundHeight,
            groundWidth, groundHeight),
      ),
      GroundObject(
        rect: Rect.fromLTWH(groundWidth, dinoObject.rect.bottom - groundHeight,
            groundWidth, groundHeight),
      ),
    ]);
    gameEngine.addGameObjects(
      [dinoObject, ...grounds],
    );
  }

  void start() {
    dinoObject.status.value = DinoStatus.running;
    for (var ground in grounds) {
      ground.speedX = -dinoJumpSpeedPixelPerMs;
    }
  }

  void jump() {
    dinoObject.status.value = DinoStatus.jumping;
  }

  void stop() {
    dinoObject.status.value = DinoStatus.dead;
    for (var ground in grounds) {
      ground.speedX = 0;
    }
  }

  void onTap() {
    if (dinoObject.status.value == DinoStatus.idle) {
      start();
    } else {
      jump();
    }
  }

  @override
  void onClose() {
    Get.find<GameEngine>().removeAllGameObjects();
    super.onClose();
  }
}

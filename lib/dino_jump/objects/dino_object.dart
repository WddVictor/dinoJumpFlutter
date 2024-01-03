import 'dart:ui';

import 'package:get/get.dart';
import 'package:getx_demo/core/game_object.dart';

import '../dino_jump_constants.dart';

enum DinoStatus {
  idle,
  jumping,
  running,
  dead,
}

class DinoObject extends GameObject {
  final status = DinoStatus.idle.obs;
  late final Worker _worker;

  DinoObject({required super.rect}) {
    sprite.updateImages([
      dinoJumpAssets[DinoJumpImageKeys.dinoIdle]!,
    ]);
    _worker = ever(status, onStatusChange);
  }

  void onStatusChange(DinoStatus status) {
    updateSprite(status);
    updateObject(status);
  }

  void updateObject(DinoStatus status) {
    switch (status) {
      case DinoStatus.running:
      case DinoStatus.idle:
      case DinoStatus.dead:
        forceX = 0;
        forceY = 0;
        speedX = 0;
        speedY = 0;
        break;
      case DinoStatus.jumping:
        speedY = -dinoJumpSpeedPixelPerMs * 2;
        forceY = -speedY / 350;
        break;
    }
  }

  @override
  void update() {
    super.update();
    if (rect.top > 300) {
      status.value = DinoStatus.running;
      rect = Rect.fromLTWH(rect.left, 300, rect.width, rect.height);
    }
  }

  void updateSprite(DinoStatus status) {
    switch (status) {
      case DinoStatus.idle:
        sprite.updateImages([
          dinoJumpAssets[DinoJumpImageKeys.dinoIdle]!,
        ]);
        break;
      case DinoStatus.jumping:
        sprite.updateImages([
          dinoJumpAssets[DinoJumpImageKeys.dinoJump]!,
        ]);
        break;
      case DinoStatus.running:
        sprite.updateImages([
          dinoJumpAssets[DinoJumpImageKeys.dinoRun1]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoRun1]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoRun1]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoRun1]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoRun2]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoRun2]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoRun2]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoRun2]!,
        ]);
        break;
      case DinoStatus.dead:
        sprite.updateImages([
          dinoJumpAssets[DinoJumpImageKeys.dinoDead1]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoDead1]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoDead1]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoDead1]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoDead2]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoDead2]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoDead2]!,
          dinoJumpAssets[DinoJumpImageKeys.dinoDead2]!,
        ]);
        break;
    }
  }

  @override
  void dispose() {
    _worker.dispose();
    super.dispose();
  }
}

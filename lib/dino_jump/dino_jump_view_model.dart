import 'dart:ui';

import 'package:get/get.dart';
import 'package:getx_demo/core/game_engine.dart';

import 'objects/dino_object.dart';

class DinoJumpViewModel extends GetxController {
  final currentStatus = DinoStatus.idle.obs;

  @override
  void onInit() {
    super.onInit();
    final gameEngine = Get.find<GameEngine>();
    gameEngine.addGameObject(DinoObject(
      rect: const Rect.fromLTWH(0, 0, 100, 100),
      speedX: 0,
      speedY: 0,
    ));
  }
}

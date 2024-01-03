import 'package:getx_demo/core/game_object.dart';

import '../dino_jump_constants.dart';

class GroundObject extends GameObject {
  GroundObject({required super.rect}) {
    sprite.updateImages([
      dinoJumpAssets[DinoJumpImageKeys.ground]!,
    ]);
  }

  @override
  void update() {
    super.update();
    if (rect.left <= -rect.width) {
      rect = rect.translate(rect.width * 2, 0);
    }
  }
}

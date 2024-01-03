import 'dart:ui';

import 'package:getx_demo/core/game_object.dart';

import '../dino_jump_constants.dart';

enum CactusSize {
  small1,
  small2,
  small3,
  large1,
  large2,
  large3,
}

extension CactusSizeExtension on CactusSize {
  double get width {
    switch (this) {
      case CactusSize.small1:
        return 34;
      case CactusSize.small2:
        return 68;
      case CactusSize.small3:
        return 102;
      case CactusSize.large1:
        return 50;
      case CactusSize.large2:
        return 98;
      case CactusSize.large3:
        return 104;
    }
  }

  double get height {
    switch (this) {
      case CactusSize.small1:
      case CactusSize.small2:
      case CactusSize.small3:
        return 70;
      case CactusSize.large1:
      case CactusSize.large2:
      case CactusSize.large3:
        return 100;
    }
  }

  String get imageKey {
    switch (this) {
      case CactusSize.small1:
        return DinoJumpImageKeys.cactusSmall1;
      case CactusSize.small2:
        return DinoJumpImageKeys.cactusSmall2;
      case CactusSize.small3:
        return DinoJumpImageKeys.cactusSmall3;
      case CactusSize.large1:
        return DinoJumpImageKeys.cactusLarge1;
      case CactusSize.large2:
        return DinoJumpImageKeys.cactusLarge2;
      case CactusSize.large3:
        return DinoJumpImageKeys.cactusLarge3;
    }
  }
}

class CactusObject extends GameObject {
  CactusObject({required Offset position, required CactusSize size})
      : super(
          rect:
              Rect.fromLTWH(position.dx, position.dy, size.width, size.height),
        ) {
    sprite.updateImages([
      size.imageKey,
    ]);
  }
}

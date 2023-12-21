import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/core/game_image_provider.dart';

import 'sprite.dart';

class GameObject {
  Rect rect;
  double speedX, speedY;
  Sprite? sprite;
  bool _isDirty = false;

  bool get isDirty => _isDirty;

  GameObject({
    required this.rect,
    required this.speedX,
    required this.speedY,
    this.sprite,
  });

  void update() {
    rect = rect.translate(speedX, speedY);
    markDirty();
  }

  void markDirty() {
    _isDirty = true;
  }

  void render(ui.Canvas canvas) {
    if (sprite != null) {
      final image = Get.find<GameImageProvider>().getImage(sprite!.imagePath);
      if (image != null) {
        paintImage(canvas: canvas, rect: rect, image: image);
      } else {
        canvas.drawRect(rect, Paint()..color = Colors.purple);
      }
    }
  }

  bool collidesWith(GameObject other) {
    return rect.overlaps(other.rect);
  }
}

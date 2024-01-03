import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/core/collision_box.dart';
import 'package:getx_demo/core/game_config.dart';
import 'package:getx_demo/core/game_image_provider.dart';

import 'sprite.dart';

abstract class GameObject {
  Rect rect;
  final CollisionBox _collisionBox;
  double speedX = 0, speedY = 0;
  double forceX = 0, forceY = 0;
  Sprite sprite = Sprite();
  bool _isDirty = false;

  bool get isDirty => _isDirty;

  GameObject({
    required this.rect,
    CollisionBox? collisionBox,
  }) : _collisionBox = collisionBox ??
            CollisionBox(
              offsetByObject: Offset.zero,
              width: rect.width,
              height: rect.height,
            );

  void update() {
    int msPerFrame = Get.find<GameConfig>().msPerFrame;
    speedX += msPerFrame * forceX;
    speedY += msPerFrame * forceY;
    rect = rect.translate(speedX * msPerFrame, speedY * msPerFrame);
    markDirty();
  }

  void markDirty() {
    _isDirty = true;
  }

  void render(ui.Canvas canvas) {
    try {
      final image =
          Get.find<GameImageProvider>().getImage(sprite.currentFrame)!;
      sprite.moveToNextFrame();
      paintImage(canvas: canvas, rect: rect, image: image);
    } catch (e) {
      canvas.drawRect(rect, Paint()..color = Colors.purple);
    }
  }

  bool isCollidedWith(GameObject other) {
    return _collisionBox.isCollidedWith(
      rect.topLeft,
      other._collisionBox,
      other.rect.topLeft,
    );
  }

  @mustCallSuper
  void dispose() {}
}

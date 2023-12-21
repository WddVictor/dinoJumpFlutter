import 'package:get/get.dart';
import 'package:getx_demo/core/game_object.dart';

enum DinoStatus {
  idle,
  jumping,
  running,
  dead,
}

class DinoObject extends GameObject {
  final status = DinoStatus.idle.obs;

  DinoObject(
      {required super.rect, required super.speedX, required super.speedY});

}

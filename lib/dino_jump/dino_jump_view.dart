import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/core/game_engine.dart';
import 'package:getx_demo/dino_jump/dino_jump_constants.dart';

import 'dino_jump_view_model.dart';

class DinoJumpView extends GetView<DinoJumpViewModel> {
  const DinoJumpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dinosaur Jump'),
      ),
      body: Get.find<GameEngine>().getView(),
    );
  }
}

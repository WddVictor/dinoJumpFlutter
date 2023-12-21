import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'welcome_view_model.dart';

class WelcomeView extends GetView<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              print("xyf build logo");
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  controller.currentColor.value,
                  BlendMode.srcATop,
                ),
                child: Lottie.asset(
                  'assets/lotties/launch_screen.json',
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                ),
              );
            }),
            Obx(
              () {
                print("xyf build step");
                return TextButton(
                  onPressed: controller.isReady ? controller.start : null,
                  child: Text(
                    controller.isReady
                        ? "Start!"
                        : "${controller.currentStage.value.name}...",
                    style: const TextStyle(fontSize: 32),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.changeColor(),
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/dino_jump/dino_jump_page.dart';

import 'welcome/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: WelcomePage.routeName,
      getPages: [
        WelcomePage(),
        DinoJumpPage(),
      ],
    );
  }
}

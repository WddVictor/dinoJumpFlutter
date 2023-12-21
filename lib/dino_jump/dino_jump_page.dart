import 'package:get/get.dart';

import 'dino_jump_view.dart';
import 'dino_jump_view_model.dart';

class DinoJumpPage extends GetPage {
  static const routeName = '/dino-jump';

  DinoJumpPage()
      : super(
            name: routeName,
            page: () => const DinoJumpView(),
            binding: BindingsBuilder.put(() => DinoJumpViewModel()));
}

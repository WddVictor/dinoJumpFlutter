import 'package:get/get.dart';

import 'welcome_view.dart';
import 'welcome_view_model.dart';

class WelcomePage extends GetPage {
  static const routeName = '/welcome';

  WelcomePage()
      : super(
          name: routeName,
          page: () => const WelcomeView(),
          binding: BindingsBuilder.put(
            () => WelcomeViewModel(),
          ),
        );
}

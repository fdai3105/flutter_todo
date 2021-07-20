import 'package:get/get.dart';

import '../modules/home/home_screen.dart';
import 'routes.dart';

class Pages {
  Pages._();

  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
  ];
}

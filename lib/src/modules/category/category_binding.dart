import 'package:get/get.dart';

import '../../data/providers/category_provider.dart';
import 'category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController(
          categoryProvider: CategoryProvider(),
        ));
  }
}

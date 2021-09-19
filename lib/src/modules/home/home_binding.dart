import 'package:flutter_todo/src/data/providers/category_provider.dart';
import 'package:get/get.dart';

import '../../data/providers/todo_provider.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
          todoProvider: TodoProvider(),
          categoryProvider: CategoryProvider(),
        ));
  }
}

import 'package:flutter_todo/src/data/providers/todo_provider.dart';
import 'package:get/get.dart';

import '../../data/providers/category_provider.dart';
import 'create_todo_controller.dart';

class CreateTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateTodoController(
          todoProvider: TodoProvider(),
          categoryProvider: CategoryProvider(),
        ));
  }
}

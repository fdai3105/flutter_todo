import '../../data/providers/todo_provider.dart';
import 'category_detail_controller.dart';
import 'package:get/get.dart';

class CategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CategoryDetailController(
        todoProvider: TodoProvider(),
      ),
    );
  }
}

import 'package:flutter_todo/src/modules/create_todo/create_todo_binding.dart';
import 'package:get/get.dart';

import '../modules/create_todo/create_todo_screen.dart';
import '../modules/home/home_screen.dart';
import 'routes.dart';

class Pages {
  Pages._();

  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(
      name: Routes.createTodo,
      page: () => const CreateTodoScreen(),
      binding: CreateTodoBinding(),
    ),
  ];
}

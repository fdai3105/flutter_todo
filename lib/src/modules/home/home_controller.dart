import 'package:flutter_todo/src/modules/login/login_binding.dart';
import 'package:flutter_todo/src/modules/login/login_screen.dart';
import 'package:flutter_todo/src/widgets/dialog_loading.dart';
import 'package:get/get.dart';

import '../../data/models/todo.dart';
import '../../data/models/user.dart';
import '../../data/providers/todo_provider.dart';
import '../../utils/share_pref.dart';

enum SortBy {
  importance,
  dueDate,
  createdDate,
  alphabetically,
  completed,
}

class HomeController extends GetxController {
  final TodoProvider todoProvider;

  HomeController({required this.todoProvider});

  final _user = Rxn<User>();
  final _todo = Rxn<Todo>();

  User? get user => _user.value;

  set user(User? value) {
    _user.value = value;
  }

  Todo? get todo => _todo.value;

  set todo(Todo? value) {
    _todo.value = value;
  }

  @override
  void onInit() {
    user = SharePref.getUser();
    loadTodos();
    super.onInit();
  }

  Future loadTodos() async {
    final response = await todoProvider.getTodos();
    if (response.ok) {
      todo = response.data!;
    }
  }

  Future logout() async {
    Get.dialog(const DialogLoading());
    await SharePref.logout();
    Get.off(() => LoginScreen(), binding: LoginBinding());
  }

// void onSortBy(SortBy sortBy) {
//   switch (sortBy) {
//     case SortBy.importance:
//       todos.sort((a, b) => a.createdAt.compareTo(b.createdAt));
//       break;
//     case SortBy.dueDate:
//       break;
//     case SortBy.createdDate:
//       todos.sort((a, b) => a.createdAt.compareTo(b.createdAt));
//       break;
//     case SortBy.alphabetically:
//       todos.sort((a, b) => a.todo.compareTo(b.todo));
//       break;
//     case SortBy.completed:
//       todos.sort((a, b) => b.isCompleted ? 1 : -1);
//       break;
//   }
//   Get.back();
// }
}

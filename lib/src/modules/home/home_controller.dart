import 'package:get/get.dart';

import '../../data/models/models.dart';

enum SortBy {
  importance,
  dueDate,
  createdDate,
  alphabetically,
  completed,
}

class HomeController extends GetxController {
  final _todos = <Todo>[
    Todo(
      todo: 'Clean room',
      isCompleted: false,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
    Todo(
      todo: 'Clean kitchen',
      isCompleted: false,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
    Todo(
      todo: 'Fix light',
      isCompleted: false,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
    Todo(
      todo: 'Cook rice',
      isCompleted: true,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
    Todo(
      todo: 'A bike',
      isCompleted: true,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
  ].obs;

  final _sortBy = SortBy.createdDate.obs;

  SortBy get sortBy => _sortBy.value;

  set sortBy(SortBy value) {
    _sortBy.value = value;
  }

  List<Todo> get todos => _todos;

  set todos(List<Todo> value) {
    _todos.value = value;
  }

  void onSortBy(SortBy sortBy) {
    switch (sortBy) {
      case SortBy.importance:
        todos.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case SortBy.dueDate:
        break;
      case SortBy.createdDate:
        todos.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case SortBy.alphabetically:
        todos.sort((a, b) => a.todo.compareTo(b.todo));
        break;
      case SortBy.completed:
        todos.sort((a, b) => b.isCompleted ? 1 : -1);
        break;
    }
    Get.back();
  }
}

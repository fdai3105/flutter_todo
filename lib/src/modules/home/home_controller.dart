import 'package:get/get.dart';

import '../../data/models/models.dart';

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
      todo: 'Cook rice',
      isCompleted: true,
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
      todo: 'Cook rice',
      isCompleted: true,
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
      todo: 'Cook rice',
      isCompleted: true,
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
      todo: 'Cook rice',
      isCompleted: true,
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
      todo: 'Cook rice',
      isCompleted: true,
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
      todo: 'Cook rice',
      isCompleted: true,
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
      todo: 'Cook rice',
      isCompleted: true,
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
      todo: 'Cook rice',
      isCompleted: true,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
  ].obs;

  List<Todo> get todos => _todos;

  set todos(List<Todo> value) {
    _todos.value = value;
  }
}

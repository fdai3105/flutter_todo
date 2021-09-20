import 'package:flutter_todo/src/data/models/todo.dart';
import 'package:get/get.dart';

import '../../data/providers/todo_provider.dart';

class CategoryDetailController extends GetxController {
  final TodoProvider todoProvider;

  CategoryDetailController({required this.todoProvider});

  final _todo = <TodoDatum>[].obs;

  List<TodoDatum> get todos => _todo;

  set todos(List<TodoDatum> value) {
    _todo.value = value;
  }

  Future loadTodos(int id) async {
    final response = await todoProvider.getTodosByCategory(id);
    if (response.ok) todos = response.data!.data;
  }
}

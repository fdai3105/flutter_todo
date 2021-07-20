part of 'models.dart';

class Todo {
  final String todo;
  bool isCompleted;
  final DateTime updatedAt;
  final DateTime createdAt;

  Todo({
    required this.todo,
    required this.isCompleted,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Todo{todo: $todo, isCompleted: $isCompleted, updatedAt: $updatedAt, createdAt: $createdAt}';
  }
}

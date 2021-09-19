import 'package:get/get.dart';

import '../../data/models/category.dart';
import '../../data/models/todo.dart';
import '../../data/models/user.dart';
import '../../data/providers/category_provider.dart';
import '../../data/providers/todo_provider.dart';
import '../../utils/share_pref.dart';
import '../../widgets/dialog_loading.dart';
import '../login/login_binding.dart';
import '../login/login_screen.dart';

enum SortBy {
  importance,
  dueDate,
  createdDate,
  alphabetically,
  completed,
}

class HomeController extends GetxController {
  final CategoryProvider categoryProvider;
  final TodoProvider todoProvider;

  HomeController({
    required this.categoryProvider,
    required this.todoProvider,
  });

  final _user = Rxn<User>();
  final _category = Rxn<Category>();
  final _todos = <TodoDatum>[].obs;

  final _sortBy = SortBy.dueDate.obs;

  User? get user => _user.value;

  set user(User? value) {
    _user.value = value;
  }

  List<TodoDatum> get todos => _todos;

  set todos(List<TodoDatum> value) {
    _todos.value = value;
  }

  Category? get category => _category.value;

  set category(Category? value) {
    _category.value = value;
  }

  SortBy get sortBy => _sortBy.value;

  set sortBy(SortBy value) {
    _sortBy.value = value;
  }

  @override
  void onInit() {
    user = SharePref.getUser();
    loadTodos();
    loadCategory();
    super.onInit();
  }

  Future loadTodos() async {
    final response = await todoProvider.getTodos();
    if (response.ok) todos = response.data!.data;
  }

  Future loadCategory() async {
    final response = await categoryProvider.getCategories();
    if (response.ok) category = response.data;
  }

  void logout() {
    Get.dialog(const DialogLoading());
    SharePref.logout();
    Get.off(() => LoginScreen(), binding: LoginBinding());
  }

  void onSortBy(SortBy sortBy) {
    if (sortBy != this.sortBy) {
      this.sortBy = sortBy;
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
          todos.sort((a, b) => b.complete ? 1 : -1);
          break;
      }
      Get.back();
    }
  }
}

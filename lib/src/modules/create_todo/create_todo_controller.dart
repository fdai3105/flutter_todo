import 'package:flutter/material.dart';
import 'package:flutter_todo/src/modules/home/home_controller.dart';
import 'package:flutter_todo/src/utils/share_pref.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/models/category.dart';
import '../../data/providers/category_provider.dart';
import '../../data/providers/todo_provider.dart';

class CreateTodoController extends GetxController {
  final TodoProvider todoProvider;
  final CategoryProvider categoryProvider;

  CreateTodoController({
    required this.todoProvider,
    required this.categoryProvider,
  });

  final _colors = <Color>[].obs;
  final _placeholderColor = Colors.transparent.obs;

  final _todo = ''.obs;
  final _selectColor = Color(Colors.blue.value).obs;
  final _due = DateTime.now().obs;

  final _categoryLoading = true.obs;
  final _categoryFilter = false.obs;
  final _categories = <CategoryDatum>[].obs;
  final _categorySelected = Rxn<CategoryDatum>();

  List<Color> get colors => _colors;

  set colors(List<Color> value) {
    _colors.value = value;
  }

  Color get placeholderColor => _placeholderColor.value;

  set placeholderColor(Color value) {
    _placeholderColor.value = value;
  }

  String get todo => _todo.value;

  set todo(String value) {
    _todo.value = value;
  }

  Color get selectColor => _selectColor.value;

  set selectColor(Color value) {
    _selectColor.value = value;
  }

  DateTime get due => _due.value;

  set due(DateTime value) {
    _due.value = value;
  }

  bool get categoryLoading => _categoryLoading.value;

  set categoryLoading(bool value) {
    _categoryLoading.value = value;
  }

  bool get categoryFilter => _categoryFilter.value;

  set categoryFilter(bool value) {
    _categoryFilter.value = value;
  }

  List<CategoryDatum> get categories => _categories;

  set categories(List<CategoryDatum> value) {
    _categories.value = value;
  }

  CategoryDatum? get categorySelected => _categorySelected.value;

  set categorySelected(CategoryDatum? value) {
    _categorySelected.value = value;
  }

  @override
  void onInit() {
    loadColors();
    super.onInit();
  }

  void loadColors() {
    colors = [
      ...SharePref.getColors().map((e) => Color(e)),
      Colors.blue,
      Colors.red,
      Colors.orange,
      Colors.grey,
      Colors.green,
      Colors.purple,
    ];
    selectColor = colors.first;
  }

  var _categoryResponse;

  Future loadCategories() async {
    categoryLoading = true;
    final response = await categoryProvider.getCategories();
    if (response.ok) {
      _categoryResponse = response.data!.data;
      categories = response.data!.data;
    }
    categoryLoading = false;
  }

  void onCategorySearch(String keyword) {
    categories = _categoryResponse;
    if (keyword.isEmpty) return;
    categories = categories.where((e) => e.title.contains(keyword)).toList();
  }

  String get displayDue {
    var str = '';
    final now = DateTime.now();
    if (due.day == now.day) {
      str = 'Today : ${DateFormat.jms().format(due)}';
    } else if (due.day == now.day + 1) {
      str = 'Tomorrow: ${DateFormat.jms().format(due)}';
    } else {
      str = DateFormat.yMMMMd().format(due);
    }
    return str;
  }

  Future createTodo() async {
    final params = {
      'todo': todo,
      'color': selectColor.value,
      'categoryID': categorySelected?.id,
    };
    final response = await todoProvider.createTodo(params);
    if (response.ok) Get.back();
    await Get.find<HomeController>().loadTodos();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo/src/data/models/category.dart';
import 'package:get/get.dart';

import '../../data/providers/category_provider.dart';

class CategoryController extends GetxController {
  final CategoryProvider categoryProvider;

  CategoryController({required this.categoryProvider});

  final _title = ''.obs;
  final _selectColor = Colors.blue.obs;
  final _category = Rxn<Category>();

  String get title => _title.value;

  set title(String value) {
    _title.value = value;
  }

  MaterialColor get selectColor => _selectColor.value;

  set selectColor(MaterialColor value) {
    _selectColor.value = value;
  }

  Category? get category => _category.value;

  set category(Category? value) {
    _category.value = value;
  }

  Future createCategory() async {
    final param = {
      'title': title,
      'color': selectColor.value,
    };
    final response = await categoryProvider.createCategory(param);
    if (response.ok) {
      Get.back();
    }
  }

  Future loadCategories() async {
    final response = await categoryProvider.getCategories();
    if (response.ok) {
      category = response.data;
    }
  }
}

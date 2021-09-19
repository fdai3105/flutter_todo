import 'package:flutter/material.dart';
import 'package:flutter_todo/src/data/models/category.dart';
import 'package:flutter_todo/src/utils/share_pref.dart';
import 'package:get/get.dart';

import '../../data/providers/category_provider.dart';

class CategoryController extends GetxController {
  final CategoryProvider categoryProvider;

  CategoryController({required this.categoryProvider});

  final _colors = <Color>[
    ...SharePref.getColors().map((e) => Color(e)),
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.grey,
    Colors.green,
    Colors.purple,
  ].obs;

  List<Color> get colors => _colors;

  set colors(List<Color> value) {
    _colors.value = value;
  }

  final _title = ''.obs;
  final _selectColor = Color(Colors.blue.value).obs;
  final _category = Rxn<Category>();

  String get title => _title.value;

  set title(String value) {
    _title.value = value;
  }

  Color get selectColor => _selectColor.value;

  set selectColor(Color value) {
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

  Future delCategory(int id) async {
    final response = await categoryProvider.delCategory(id);
    if(response.ok) await loadCategories();
    Get.back();
  }
}

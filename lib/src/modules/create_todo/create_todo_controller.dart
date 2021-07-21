import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTodoController extends GetxController {
  final _selectColor = Colors.blue.obs;

  MaterialColor get selectColor => _selectColor.value;

  set selectColor(MaterialColor value) {
    _selectColor.value = value;
  }
}

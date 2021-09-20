import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/src/modules/home/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../data/models/category.dart';
import '../../theme/theme.dart';
import '../../widgets/widgets.dart';
import 'category_detail_controller.dart';

class CategoryDetailScreen extends GetView {
  final CategoryDatum category;

  const CategoryDetailScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: WidgetAppBar(title: category.title),
      body: SafeArea(
        child: GetX<CategoryDetailController>(
          initState: (state) {
            state.controller!.loadTodos(category.id);
          },
          builder: (controller) {
            if (controller.todos.isEmpty) {
              return const Center(child: Text('empty'));
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: controller.todos.length,
              itemBuilder: (context, i) {
                return WidgetTodoItem(
                  todo: controller.todos[i],
                  onTap: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}

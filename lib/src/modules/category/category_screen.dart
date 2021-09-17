import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../../widgets/widgets.dart';
import '../home/widgets/widgets.dart';
import 'category_controller.dart';
import 'create_category/create_category_screne.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: WidgetAppBar(
        title: 'Category',
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const CreateCategoryScreen()),
            icon: const Icon(Icons.add_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort_rounded),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<CategoryController>(
              initState: (state) {
                state.controller!.loadCategories();
              },
              builder: (_) {
                if (controller.category == null ||
                    controller.category!.data.isEmpty) {
                  return const Center(child: Text('empty'));
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  itemCount: controller.category!.data.length,
                  itemBuilder: (context, i) {
                    final item = controller.category!.data[i];
                    return WidgetCategoryItem(
                      title: item.title,
                      taskCount: item.total,
                      completed: item.completed,
                      margin: const EdgeInsets.only(bottom: 10),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

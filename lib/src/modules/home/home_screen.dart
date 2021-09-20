import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../data/providers/category_provider.dart';
import '../../data/providers/todo_provider.dart';
import '../../theme/theme.dart';
import '../category/category_binding.dart';
import '../category/category_screen.dart';
import '../category_detail/category_detail_binding.dart';
import '../category_detail/category_detail_screen.dart';
import '../create_todo/create_todo_controller.dart';
import '../create_todo/create_todo_screen.dart';
import 'home_controller.dart';
import 'widgets/widgets.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Whats\'up ${controller.user?.name}',
          style: AppTextTheme.title,
        ),
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => controller.onInit(),
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  WidgetContainer(
                    title: 'CATEGORY',
                    onTitleTap: () => Get.to(
                      () => const CategoryScreen(),
                      binding: CategoryBinding(),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: AppColors.light1,
                    ),
                    child: SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: GetX<HomeController>(
                        builder: (_) {
                          if (controller.category == null ||
                              controller.category!.data.isEmpty) {
                            return const Center(child: Text('Empty'));
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemCount: controller.category!.data.length,
                            itemBuilder: (context, i) {
                              final item = controller.category!.data[i];
                              return WidgetCategoryItem(
                                title: item.title,
                                total: item.total,
                                completed: item.completed,
                                onTap: () => Get.to(
                                  () => CategoryDetailScreen(category: item),
                                  binding: CategoryDetailBinding(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  WidgetContainer(
                    title: 'TODAY\'S TASK\'S',
                    trailing: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: _showSortSheet,
                      child: SvgPicture.asset(
                        'assets/svg/sort.svg',
                        color: AppColors.light1,
                      ),
                    ),
                    child: GetX<HomeController>(
                      builder: (_) {
                        if (controller.todos.isEmpty) {
                          return const Center(
                            child: Text('Nothing to do today'),
                          );
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.todos.length,
                          itemBuilder: (context, i) {
                            final item = controller.todos[i];
                            return WidgetTodoItem(
                              todo: item,
                              onTap: () => controller.onTodoTap(item),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (context, callback) {
          Get.lazyPut(() => CreateTodoController(
                todoProvider: TodoProvider(),
                categoryProvider: CategoryProvider(),
              ));
          return const CreateTodoScreen();
        },
        closedBuilder: (context, callback) {
          return const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          );
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        openColor: Colors.transparent,
        openElevation: 0,
      ),
    );
  }

  void _showSortSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 6,
              width: 30,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.light2,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Obx(() => ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text(
                        'Sort by:',
                        style: AppTextTheme.text.copyWith(
                          color: AppColors.light,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        controller.onSortBy(SortBy.alphabetically);
                      },
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 10,
                      leading: Container(
                        height: double.infinity,
                        width: 2,
                        color: controller.sortBy == SortBy.alphabetically
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                      title: Text(
                        'Alphabetically',
                        style: AppTextTheme.text,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        controller.onSortBy(SortBy.dueDate);
                      },
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 10,
                      leading: Container(
                        height: double.infinity,
                        width: 2,
                        color: controller.sortBy == SortBy.dueDate
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                      title: Text(
                        'Due date',
                        style: AppTextTheme.text,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        controller.onSortBy(SortBy.createdDate);
                      },
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 10,
                      leading: Container(
                        height: double.infinity,
                        width: 2,
                        color: controller.sortBy == SortBy.createdDate
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                      title: Text(
                        'Creation date',
                        style: AppTextTheme.text,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        controller.onSortBy(SortBy.completed);
                      },
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 10,
                      leading: Container(
                        height: double.infinity,
                        width: 2,
                        color: controller.sortBy == SortBy.completed
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                      title: Text(
                        'Creation date',
                        style: AppTextTheme.text,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

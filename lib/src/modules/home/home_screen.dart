import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../create_todo/create_todo_controller.dart';
import '../create_todo/create_todo_screen.dart';
import 'home_controller.dart';
import 'widgets/widgets.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Whats\'up Dai Hoang',
                  style: AppTextTheme.title,
                ),
              ),
              const SizedBox(height: 30),
              WidgetContainer(
                title: 'CATEGORY',
                child: SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      WidgetCategoryItem(
                        title: 'Business',
                        taskCount: 20,
                        completed: 10,
                      ),
                      WidgetCategoryItem(
                        title: 'Business',
                        taskCount: 30,
                        completed: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              WidgetContainer(
                title: 'TODAY\'S TASK\'S',
                trailing: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
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
                            ListView(
                              shrinkWrap: true,
                              children: [
                                ListTile(
                                  onTap: () {
                                    controller.onSortBy(SortBy.alphabetically);
                                  },
                                  title: Text(
                                    'Alphabetically',
                                    style: AppTextTheme.text,
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Due date',
                                    style: AppTextTheme.text,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    controller.onSortBy(SortBy.createdDate);
                                  },
                                  title: Text(
                                    'Creation date',
                                    style: AppTextTheme.text,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    controller.onSortBy(SortBy.completed);
                                  },
                                  title: Text(
                                    'Creation date',
                                    style: AppTextTheme.text,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/svg/sort.svg',
                    color: AppColors.light1,
                  ),
                ),
                child: GetX<HomeController>(
                  builder: (_) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.todos.length,
                      itemBuilder: (context, i) {
                        return WidgetTodoItem(
                          todo: controller.todos[i],
                          onTap: () {
                            controller.todos =
                                controller.todos.where((element) {
                              if (element == controller.todos[i]) {
                                element.isCompleted = !element.isCompleted;
                                return true;
                              }
                              return true;
                            }).toList();
                          },
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
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (context, callback) {
          Get.lazyPut(() => CreateTodoController());
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
}

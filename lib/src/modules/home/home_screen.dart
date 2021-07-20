import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
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
    );
  }
}

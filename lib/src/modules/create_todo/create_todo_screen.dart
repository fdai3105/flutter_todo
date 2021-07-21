import 'package:flutter/material.dart';
import 'package:flutter_todo/src/modules/create_todo/create_todo_controller.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import 'widgets/widgets.dart';

class CreateTodoScreen extends GetView<CreateTodoController> {
  const CreateTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: Get.back,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border, width: 2),
                  ),
                  child: const Icon(Icons.close, color: Colors.black),
                ),
              ),
              Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter new task',
                      hintStyle: TextStyle(
                        color: AppColors.dark1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GetX<CreateTodoController>(
                    builder: (_) {
                      return Row(
                        children: [
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.border,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: AppColors.dark,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Today',
                                  style: TextStyle(
                                    color: AppColors.dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 14),
                          WidgetColorButton(
                            color: controller.selectColor,
                            onTap: (color) {
                              controller.selectColor = color;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 34,
                        color: AppColors.dark,
                      ),
                      const SizedBox(width: 40),
                      Icon(
                        Icons.favorite_border,
                        size: 34,
                        color: AppColors.dark,
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 26,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'New task',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: AppColors.text,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

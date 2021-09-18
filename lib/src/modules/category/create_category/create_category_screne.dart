import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../create_todo/widgets/widgets.dart';
import '../category_controller.dart';

class CreateCategoryScreen extends GetView<CategoryController> {
  const CreateCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
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
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter new task',
                        hintStyle: TextStyle(
                          color: AppColors.dark1,
                        ),
                      ),
                      onChanged: (value) => controller.title = value,
                    ),
                    const SizedBox(height: 20),
                    GetX<CategoryController>(
                      builder: (_) {
                        return Row(
                          children: [
                            WidgetColorButton(
                              colors: controller.colors,
                              color: controller.selectColor,
                              onTap: (color) => controller.selectColor = color,
                              onAddColor: () {},
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                _buildNewButton(() => controller.createCategory()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildNewButton(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.6),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'New task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.keyboard_arrow_up,
              color: AppColors.light,
            )
          ],
        ),
      ),
    );
  }
}

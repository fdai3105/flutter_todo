import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../../utils/share_pref.dart';
import '../../widgets/widgets.dart';
import 'create_todo_controller.dart';
import 'widgets/widgets.dart';

class CreateTodoScreen extends GetView<CreateTodoController> {
  const CreateTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: false,
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
                      border: Border.all(color: AppColors.light1, width: 3),
                    ),
                    child: Icon(Icons.close, color: AppColors.light1),
                  ),
                ),
                GetX<CreateTodoController>(
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: const TextStyle(
                            fontSize: 28,
                            color: AppColors.light,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter new task',
                            hintStyle: TextStyle(
                              color: AppColors.dark1,
                            ),
                          ),
                          onChanged: (str) => controller.todo = str,
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _showCategoryBSheet,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.light1,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.list_rounded,
                                  color: AppColors.light1,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  controller.categorySelected?.title ??
                                      'Category',
                                  style: TextStyle(
                                    color: AppColors.light1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            DatePicker.showDateTimePicker(
                              context,
                              minTime: controller.due.millisecondsSinceEpoch <
                                      DateTime.now().millisecondsSinceEpoch
                                  ? controller.due
                                  : DateTime.now(),
                              currentTime: controller.due,
                              theme: DatePickerTheme(
                                backgroundColor: AppColors.primary,
                                cancelStyle: TextStyle(color: AppColors.light1),
                                itemStyle: TextStyle(color: AppColors.light1),
                              ),
                              onConfirm: (time) => controller.due = time,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.light1,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: AppColors.light1,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  controller.displayDue,
                                  style: TextStyle(
                                    color: AppColors.light1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        WidgetColorButton(
                          colors: controller.colors,
                          color: controller.selectColor,
                          onTap: (color) => controller.selectColor = color,
                          onAddColor: _addColor,
                        ),
                      ],
                    );
                  },
                ),
                WidgetButton(
                  onTap: controller.createTodo,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addColor() {
    Get.bottomSheet(Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Container(
                margin: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: controller.placeholderColor, width: 2),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: controller.placeholderColor,
                            width: 4,
                          ),
                        ),
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: controller.placeholderColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 20),
          ColorPicker(
            pickerColor: controller.placeholderColor,
            onColorChanged: (color) {},
            pickerAreaHeightPercent: 0,
            enableAlpha: true,
            showLabel: false,
            paletteType: PaletteType.hsv,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              SharePref.saveColors(controller.placeholderColor.value);
              controller.loadColors();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ));
  }

  Future<dynamic> _showCategoryBSheet() {
    return Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(12),
            right: Radius.circular(12),
          ),
        ),
        child: GetX<CreateTodoController>(
          initState: (state) {
            state.controller!.categoryFilter = false;
            state.controller!.loadCategories();
          },
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 4,
                  width: 40,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.dark3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (controller.categoryFilter) {
                                controller.categoryFilter = false;
                                controller.onCategorySearch('');
                              } else {
                                Get.back();
                              }
                            },
                            icon: Icon(
                              controller.categoryFilter
                                  ? Icons.keyboard_arrow_left_rounded
                                  : Icons.close_rounded,
                              color: AppColors.light1,
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (!controller.categoryFilter)
                            const Text(
                              'Select Category',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                      if (controller.categoryFilter)
                        Flexible(
                          child: TextField(
                            style: const TextStyle(color: AppColors.light),
                            decoration: InputDecoration(
                              hintText: 'Filter category',
                              hintStyle: TextStyle(color: AppColors.light2),
                              border: InputBorder.none,
                            ),
                            onChanged: (str) =>
                                controller.onCategorySearch(str),
                          ),
                        ),
                      IconButton(
                        onPressed: () {
                          controller.categoryFilter =
                              !controller.categoryFilter;
                        },
                        icon: const Icon(
                          Icons.search_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: controller.categoryLoading
                      ? const Center(child: CupertinoActivityIndicator())
                      : controller.categories.isEmpty
                          ? const Center(child: Text('empty'))
                          : ListView.builder(
                              itemCount: controller.categories.length + 1,
                              itemBuilder: (context, i) {
                                if (i == 0) {
                                  return ListTile(
                                    onTap: () =>
                                        controller.categorySelected = null,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 0,
                                    ),
                                    leading: Obx(() => Container(
                                          height: double.infinity,
                                          width: 3,
                                          color: controller.categorySelected ==
                                                  null
                                              ? Colors.blue
                                              : Colors.transparent,
                                        )),
                                    minLeadingWidth: 10,
                                    title: const Text('No category'),
                                  );
                                }
                                final item = controller.categories[i - 1];
                                return ListTile(
                                  onTap: () {
                                    controller.categorySelected = item;
                                  },
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 0,
                                  ),
                                  leading: Obx(() => Container(
                                        height: double.infinity,
                                        width: 3,
                                        color: item.id ==
                                                controller.categorySelected?.id
                                            ? Colors.blue
                                            : Colors.transparent,
                                      )),
                                  minLeadingWidth: 10,
                                  title: Text(
                                    item.title,
                                    style:
                                        const TextStyle(color: AppColors.light),
                                  ),
                                );
                              },
                            ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

part of 'widgets.dart';

class WidgetBSheet extends StatelessWidget {
  final String title;
  final Widget body;

  const WidgetBSheet({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(12),
          right: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                      onPressed: Get.back,
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppColors.light1,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body,
        ],
      ),
    );
  }
}

part of 'widgets.dart';

class WidgetCategoryItem extends StatefulWidget {
  final int total;
  final String title;
  final int completed;
  final Function() onTap;
  final Function()? onLongPress;
  final EdgeInsets? margin;

  const WidgetCategoryItem({
    Key? key,
    required this.total,
    required this.title,
    required this.completed,
    this.margin,
    this.onLongPress,
    required this.onTap,
  }) : super(key: key);

  @override
  _WidgetCategoryItemState createState() => _WidgetCategoryItemState();
}

class _WidgetCategoryItemState extends State<WidgetCategoryItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> tween;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    tween = Tween<double>(
      begin: 0,
      end: widget.completed > widget.total
          ? 1
          : widget.completed / widget.total,
    ).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Container(
        width: 200,
        height: 100,
        margin: widget.margin ?? const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.total} tasks',
              style: AppTextTheme.categoryCount,
            ),
            Text(
              widget.title,
              style: AppTextTheme.categoryTitle,
            ),
            Stack(
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                AnimatedBuilder(
                  animation: tween,
                  builder: (context, widget) {
                    return FractionallySizedBox(
                      widthFactor: this.widget.completed == 0 ? 0 : tween.value,
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${widget.completed}/${widget.total}',
                  style: AppTextTheme.categoryCount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

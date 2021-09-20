part of 'widgets.dart';

class WidgetTodoItem extends StatefulWidget {
  final TodoDatum todo;
  final Function() onTap;

  const WidgetTodoItem({
    Key? key,
    required this.todo,
    required this.onTap,
  }) : super(key: key);

  @override
  _WidgetTodoItemState createState() => _WidgetTodoItemState();
}

class _WidgetTodoItemState extends State<WidgetTodoItem>
    with TickerProviderStateMixin {
  late final AnimationController checkboxAnimation;
  late final AnimationController animation;
  late final Tween<double> tween;

  @override
  void initState() {
    checkboxAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 400),
    );
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    tween = Tween(begin: 0, end: 1)
      ..animate(animation).addListener(() {
        setState(() {});
      });
    startAnimation();
    super.initState();
  }

  void startAnimation() {
    if (widget.todo.complete) {
      checkboxAnimation.forward();
      animation.forward();
    } else {
      checkboxAnimation.reverse();
      animation.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await widget.onTap();
        startAnimation();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Opacity(
              opacity: 0.4,
              child: Lottie.asset(
                'assets/lottie/checkbox.json',
                height: 36,
                width: 36,
                controller: checkboxAnimation,
                delegates: LottieDelegates(
                  values: [
                    // bg color
                    ValueDelegate.color(
                      const ['Layer 3/check Outlines 2', '**', 'Fill 1'],
                      value: Colors.green,
                    ),
                    // tick color
                    ValueDelegate.color(
                      const ['Layer 3/check Outlines', '**', 'Fill 1'],
                      value: AppColors.primary,
                    ),
                    // border color
                    ValueDelegate.strokeColor(
                      const ['Layer 3/check Outlines', '**', 'Stroke 1'],
                      value: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Stack(
              children: [
                Positioned.fill(
                  child: FractionallySizedBox(
                    widthFactor: animation.value,
                    alignment: Alignment.centerLeft,
                    child: Divider(
                      thickness: 1,
                      color: AppColors.light2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    widget.todo.todo,
                    style: widget.todo.complete
                        ? AppTextTheme.taskTitle2
                        : AppTextTheme.taskTitle,
                  ),
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
    checkboxAnimation.dispose();
    animation.dispose();
    super.dispose();
  }
}

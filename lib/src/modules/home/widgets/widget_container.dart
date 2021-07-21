part of 'widgets.dart';

class WidgetContainer extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Widget child;

  const WidgetContainer({
    Key? key,
    required this.title,
    this.trailing,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextTheme.containerTitle,
              ),
              trailing ?? const SizedBox(),
            ],
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}

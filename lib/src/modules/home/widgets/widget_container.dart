part of 'widgets.dart';

class WidgetContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const WidgetContainer({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: AppTextTheme.containerTitle,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}

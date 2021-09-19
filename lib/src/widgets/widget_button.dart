part of 'widgets.dart';

class WidgetButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final Color color;

  const WidgetButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

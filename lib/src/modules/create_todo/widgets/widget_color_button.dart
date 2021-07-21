part of 'widgets.dart';

class WidgetColorButton extends StatelessWidget {
  final Color color;
  final Function(MaterialColor) onTap;

  const WidgetColorButton({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildDot(Colors.blue),
            _buildDot(Colors.red),
            _buildDot(Colors.orange),
            _buildDot(Colors.yellow),
            _buildDot(Colors.green),
            _buildDot(Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(MaterialColor color) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () => onTap(color),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: this.color == color
                ? Border.all(color: AppColors.border, width: 2)
                : Border.all(color: Colors.transparent, width: 2),
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color.withOpacity(0.4), width: 4),
              ),
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

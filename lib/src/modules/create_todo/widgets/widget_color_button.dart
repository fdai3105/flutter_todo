part of 'widgets.dart';

class WidgetColorButton extends StatelessWidget {
  final List<Color> colors;
  final Color color;
  final Function(Color) onTap;
  final Function() onAddColor;

  const WidgetColorButton({
    Key? key,
    required this.colors,
    required this.color,
    required this.onTap,
    required this.onAddColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...colors.map(_buildDot),
          _buildRainbow(onAddColor),
        ],
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () => onTap(color),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: this.color == color
                ? Border.all(color: color.withOpacity(0.4), width: 2)
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

  Widget _buildRainbow(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.add_rounded, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

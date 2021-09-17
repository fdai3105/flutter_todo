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
            ...SharePref.getColors().map(
              (e) => _buildDot(MaterialColor(e, {})),
            ),
            _buildDot(Colors.blue),
            _buildDot(Colors.red),
            _buildDot(Colors.orange),
            _buildDot(Colors.grey),
            _buildDot(Colors.green),
            _buildDot(Colors.purple),
            _buildRainbow(() {
              var color = const Color(0xff443a49);
              Get.dialog(AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SlidePicker(
                      pickerColor: color,
                      onColorChanged: (value) => color = value,
                      paletteType: PaletteType.rgb,
                      enableAlpha: false,
                      displayThumbColor: true,
                      showLabel: false,
                      showIndicator: false,
                    ),
                    ElevatedButton(
                      onPressed: () => SharePref.saveColors(color.value),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ));
            }),
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

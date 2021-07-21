part of 'theme.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color.fromRGBO(20, 22, 41, 1);
  static const Color secondary = Color.fromRGBO(28, 32, 58, 1);

  static const Color text = Colors.white;
  static final Color text1 = Colors.white.withOpacity(0.6);
  static final Color text2 = Colors.white.withOpacity(0.4);

  static final Color dark = Colors.black.withOpacity(0.6);
  static final Color dark1 = Colors.grey.withOpacity(0.6);
  static final Color dark2 = Colors.grey.withOpacity(0.4);
  static final Color dark3 = Colors.grey.withOpacity(0.2);

  static final Color border = dark2;
  static final Color borderLight = text1;
}

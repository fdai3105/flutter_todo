part of 'theme.dart';

class AppTextTheme {
  AppTextTheme._();

  static const title = TextStyle(
    color: AppColors.text,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static final containerTitle = TextStyle(
    color: AppColors.text1,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle categoryCount = TextStyle(
    color: AppColors.text2,
  );

  static const TextStyle categoryTitle = TextStyle(
    color: AppColors.text,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle taskTitle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle taskTitle2 = taskTitle.copyWith(
    color: AppColors.text2,
  );
}

part of 'theme.dart';

class AppTextTheme {
  AppTextTheme._();

  static const title = TextStyle(
    color: AppColors.light,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static final containerTitle = TextStyle(
    color: AppColors.light1,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle categoryCount = TextStyle(
    color: AppColors.light2,
  );

  static const TextStyle categoryTitle = TextStyle(
    color: AppColors.light,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle taskTitle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle taskTitle2 = taskTitle.copyWith(
    color: AppColors.light2,
  );

  static final TextStyle text = TextStyle(
    color: AppColors.light1,
  );
}

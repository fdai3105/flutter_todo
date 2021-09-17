import 'package:flutter/material.dart';
import 'package:flutter_todo/src/modules/login/login_binding.dart';
import 'package:flutter_todo/src/modules/login/login_screen.dart';
import 'package:flutter_todo/src/modules/register/register_binding.dart';
import 'package:flutter_todo/src/modules/register/register_screen.dart';
import 'package:flutter_todo/src/theme/theme.dart';
import 'package:get/get.dart';

class StartScreen extends GetView {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Todo App',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                WidgetButton(
                  onTap: () => Get.to(
                    () => LoginScreen(),
                    binding: LoginBinding(),
                  ),
                  text: 'Login',
                ),
                const SizedBox(height: 20),
                WidgetButton(
                  onTap: () => Get.to(
                    () => const RegisterScreen(),
                    binding: RegisterBinding(),
                  ),
                  text: 'Register',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const WidgetButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

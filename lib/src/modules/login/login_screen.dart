import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.light,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'So excited to see you again',
                style: TextStyle(
                  color: AppColors.light1,
                ),
              ),
              const SizedBox(height: 20),
              WidgetInput(
                label: 'Email',
                controller: _emailCtrl,
              ),
              const SizedBox(height: 10),
              WidgetInput(
                label: 'Password',
                controller: _passCtrl,
              ),
              const SizedBox(height: 20),
              InkWell(
                borderRadius: BorderRadius.circular(6),
                splashColor: Colors.white,
                highlightColor: Colors.transparent,
                onTap: () => controller.login(_emailCtrl.text, _passCtrl.text),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.99),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetInput extends StatelessWidget {
  final String label;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const WidgetInput({
    Key? key,
    required this.label,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.light1),
        focusColor: AppColors.light,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.light2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.light),
        ),
      ),
    );
  }
}

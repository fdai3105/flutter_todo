import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';

class RegisterScreen extends GetView {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: const [
          Text('register'),
        ],
      ),
    );
  }
}

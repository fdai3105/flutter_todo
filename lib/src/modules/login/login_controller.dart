import 'package:flutter/material.dart';
import 'package:flutter_todo/src/widgets/dialog_loading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../data/providers/user_provider.dart';
import '../../utils/share_pref.dart';
import '../home/home_binding.dart';
import '../home/home_screen.dart';

class LoginController extends GetxController {
  final UserProvider userProvider;

  LoginController({required this.userProvider});

  Future login(String email, String pass) async {
    _showLoading();
    final map = {'email': email, 'pass': pass};
    final response = await userProvider.login(map);
    print(response.toString());
    if (response.ok) {
      await SharePref.saveUser(response.data!);
      await Get.off(() => HomeScreen(), binding: HomeBinding());
    } else {
      Get.back();
      if (response.code == HttpStatus.forbidden) {
        showInfoDialog('Login fail', 'Email or password not correct');
      } else if (response.code == HttpStatus.unauthorized) {
        showInfoDialog('Login fail', 'User not found, please register');
      } else {
        showInfoDialog('Login fail', 'Something wrong, try late');
      }
    }
  }

  void _showLoading() {
    Get.dialog(const DialogLoading());
  }
}

void showInfoDialog(String title, String content) {
  Get.dialog(AlertDialog(
    title: Text(title),
    content: Text(content),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_todo/src/modules/home/home_binding.dart';
import 'package:flutter_todo/src/modules/home/home_screen.dart';
import 'package:flutter_todo/src/modules/start/start_screen.dart';
import 'package:flutter_todo/src/theme/theme.dart';
import 'package:get/get.dart';

import 'src/routes/pages.dart';
import 'src/utils/share_pref.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharePref.initial();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      getPages: Pages.pages,
      initialBinding: SharePref.getUser() == null ? null : HomeBinding(),
      home: SharePref.getUser() == null ? const StartScreen() : HomeScreen(),
    );
  }
}

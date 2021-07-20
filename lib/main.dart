import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/modules/home/home_binding.dart';
import 'src/modules/home/home_screen.dart';
import 'src/routes/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      initialBinding: HomeBinding(),
      home: const HomeScreen(),
    );
  }
}

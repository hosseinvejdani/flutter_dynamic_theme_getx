import 'package:flutter_dynamic_theme_getx/controller/theme_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Dynamic Theme",
          theme: controller.themeData.value,
          home: const MyHomePage(),
        );
      },
    );
  }
}

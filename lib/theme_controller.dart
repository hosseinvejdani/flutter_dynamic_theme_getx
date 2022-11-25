import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme_values.dart';

class ThemeController extends GetxController {
  final Rx<ThemeData> _themeData = blueTheme.obs;

  Rx<ThemeData> get themeData => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData.value = themeData;
    update();
  }
}

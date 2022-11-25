import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class ThemeController extends GetxController {
  final Rx<ThemeData> _themeData = AppThemes.lightGreenTheme.obs;

  Rx<ThemeData> get themeData => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData.value = themeData;
    update();
  }
}

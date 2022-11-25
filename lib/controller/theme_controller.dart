import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

enum ThemeMode {
  LIGHT,
  DARK
}

class ThemeController extends GetxController {
  final Rx<ThemeData> _themeData = AppThemes.greenTheme.obs;
  final Rx<ThemeMode> _themeMode = ThemeMode.LIGHT.obs;

  Rx<ThemeData> get themeData => _themeData;
  Rx<ThemeMode> get themeMode => _themeMode;
  RxBool get isLightMode => (_themeMode.value == ThemeMode.LIGHT).obs;

  setThemeData(ThemeData themeData) async {
    if (_themeMode.value == ThemeMode.LIGHT) {
      _themeData.value = themeData;
    } else {
      if (themeData == AppThemes.greenTheme) {
        _themeData.value = AppThemes.darkGreenTheme;
      } else if (themeData == AppThemes.redTheme) {
        _themeData.value = AppThemes.darkRedTheme;
      }
    }
    update();
  }

  setThemeMode(bool isLight) async {
    if (isLight) {
      _themeMode.value = ThemeMode.LIGHT;
    } else {
      _themeMode.value = ThemeMode.DARK;
    }
    _toggleThemeData();
    update();
  }

  _toggleThemeData() async {
    if (_themeData.value == AppThemes.greenTheme) {
      _themeData.value = AppThemes.darkGreenTheme;
    } else if (_themeData.value == AppThemes.darkGreenTheme) {
      _themeData.value = AppThemes.greenTheme;
    } else if (_themeData.value == AppThemes.redTheme) {
      _themeData.value = AppThemes.darkRedTheme;
    } else if (_themeData.value == AppThemes.darkRedTheme) {
      _themeData.value = AppThemes.redTheme;
    }
  }
}

import 'package:flutter/material.dart';

import 'colors.dart';

final _colorSchemeLightGreen = ColorScheme.fromSeed(
  seedColor: AppColors.green,
  brightness: Brightness.light,
);
final _colorSchemeDarkGreen = ColorScheme.fromSeed(
  seedColor: AppColors.green,
  brightness: Brightness.dark,
);

final _colorSchemeLightRed = ColorScheme.fromSeed(
  seedColor: AppColors.red,
  brightness: Brightness.light,
);

final _colorSchemeDarkRed = ColorScheme.fromSeed(
  seedColor: AppColors.red,
  brightness: Brightness.dark,
);

class AppThemes {
  AppThemes._();

  /// ----  Green Theme  ----
  static final lightGreenTheme = ThemeData.from(colorScheme: _colorSchemeLightGreen);
  static final darkGreenTheme = ThemeData.from(colorScheme: _colorSchemeDarkGreen);

  /// ----  red Theme  ----
  static final lightRedTheme = ThemeData.from(colorScheme: _colorSchemeLightRed);
  static final darkRedTheme = ThemeData.from(colorScheme: _colorSchemeDarkRed);
}

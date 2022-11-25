import 'package:flutter_dynamic_theme_getx/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  final ThemeData buttonThemeData;

  const ThemeButton({super.key, required this.buttonThemeData});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();

    return RawMaterialButton(
      onPressed: () {
        controller.setTheme(buttonThemeData);
      },
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: buttonThemeData.primaryColor,
      padding: const EdgeInsets.all(15.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: _getIcon(),
      ),
    );
  }

  Widget _getIcon() {
    final controller = Get.find<ThemeController>();
    bool selected = (controller.themeData.value == buttonThemeData);
    bool isDark = buttonThemeData.brightness == Brightness.dark;

    return Container(
      key: Key((selected) ? "ON" : "OFF"),
      child: Icon(
        (selected) ? Icons.done : null,
        color: isDark ? buttonThemeData.colorScheme.primary : buttonThemeData.colorScheme.onPrimary,
        size: 20.0,
      ),
    );
  }
}

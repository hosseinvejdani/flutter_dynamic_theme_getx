import 'package:flutter_dynamic_theme_getx/theme_controller.dart';
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

    return Container(
      key: Key((selected) ? "ON" : "OFF"),
      child: Icon(
        (selected) ? Icons.done : Icons.close,
        color: buttonThemeData.accentColor,
        size: 20.0,
      ),
    );
  }
}

import 'package:flutter_dynamic_theme_getx/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  final ThemeData buttonThemeData;
  final ThemeData buttonThemeDataDark;

  const ThemeButton({super.key, required this.buttonThemeData, required this.buttonThemeDataDark});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();

    return RawMaterialButton(
      onPressed: () {
        controller.setThemeData(buttonThemeData);
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
    bool selected = (controller.themeData.value == buttonThemeData || controller.themeData.value == buttonThemeDataDark);

    return Container(
      key: Key((selected) ? "ON" : "OFF"),
      child: Icon(
        (selected) ? Icons.done : null,
        color: buttonThemeData.colorScheme.onPrimary,
        size: 20.0,
      ),
    );
  }
}

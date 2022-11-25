import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dynamic_theme_getx/controller/theme_controller.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';
import '../widgets/widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Select Pre-defined Themes",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ThemeButton(buttonThemeData: AppThemes.greenTheme, buttonThemeDataDark: AppThemes.darkGreenTheme),
                  ThemeButton(buttonThemeData: AppThemes.redTheme, buttonThemeDataDark: AppThemes.darkRedTheme),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Light or Dark?",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(height: 10),
            Switch(
              value: themeController.isLightMode.value,
              onChanged: (bool isLight) {
                themeController.setThemeMode(isLight);
              },
            ),
            const SizedBox(height: 10),
            Text(
              "Current Theme Colors",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 4),
            _themeColorShowCase(context, "primary", Theme.of(context).colorScheme.primary),
            _themeColorShowCase(context, "onPrimary", Theme.of(context).colorScheme.onPrimary),
            _themeColorShowCase(context, "primaryContainer", Theme.of(context).colorScheme.primaryContainer),
            _themeColorShowCase(context, "onPrimaryContainer", Theme.of(context).colorScheme.onPrimaryContainer),
            _themeColorShowCase(context, "secondary", Theme.of(context).colorScheme.secondary),
            _themeColorShowCase(context, "onSecondary", Theme.of(context).colorScheme.onSecondary),
            _themeColorShowCase(context, "secondaryContainer", Theme.of(context).colorScheme.secondaryContainer),
            _themeColorShowCase(context, "onSecondaryContainer", Theme.of(context).colorScheme.onSecondaryContainer),
            _themeColorShowCase(context, "tertiary", Theme.of(context).colorScheme.tertiary),
            _themeColorShowCase(context, "onTertiary", Theme.of(context).colorScheme.onTertiary),
            _themeColorShowCase(context, "tertiaryContainer", Theme.of(context).colorScheme.tertiaryContainer),
            _themeColorShowCase(context, "onTertiaryContainer", Theme.of(context).colorScheme.onTertiaryContainer),
            _themeColorShowCase(context, "error", Theme.of(context).colorScheme.error),
            _themeColorShowCase(context, "errorContainer", Theme.of(context).colorScheme.errorContainer),
            _themeColorShowCase(context, "onError", Theme.of(context).colorScheme.onError),
            _themeColorShowCase(context, "onErrorContainer", Theme.of(context).colorScheme.onErrorContainer),
            _themeColorShowCase(context, "background", Theme.of(context).colorScheme.background),
            _themeColorShowCase(context, "onBackground", Theme.of(context).colorScheme.onBackground),
            _themeColorShowCase(context, "surface", Theme.of(context).colorScheme.surface),
            _themeColorShowCase(context, "onSurface", Theme.of(context).colorScheme.onSurface),
          ],
        ),
      ),
    );
  }

  // Returns simple container to display what color the theme is currently using.
  Widget _themeColorShowCase(BuildContext context, String colorName, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.grey),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              colorName,
              textAlign: TextAlign.left,
              style: Theme.of(context).primaryTextTheme.button?.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

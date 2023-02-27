import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:moviles1/settings/textStyleSettings.dart';

class ThemeApp {
  TextStyleSettings? textStyleSettings;
  ThemeApp() {
    textStyleSettings = TextStyleSettings();
  }

  TextTheme get textTheme => TextTheme(
        displayLarge: textStyleSettings!.H1,
        displayMedium: textStyleSettings!.H2,
        labelLarge: textStyleSettings!.sbt,
        labelMedium: textStyleSettings!.b2,
      );
}

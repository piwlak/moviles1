import 'package:flutter/material.dart';

class StyleSettings {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 255, 209, 44)));
  }

  static ThemeData DarTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 1, 91, 119)));
  }
}

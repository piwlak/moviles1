import 'package:flutter/material.dart';

class StyleSettings {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Color.fromARGB(255, 255, 65, 230),
            primaryContainer: Colors.pink,
            onPrimaryContainer: Colors.pink,
            onPrimary: Color.fromARGB(255, 255, 255, 255)));
  }

  static ThemeData DarTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Color.fromARGB(255, 0, 75, 65),
            ));
  }
}

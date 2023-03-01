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
              primary: Color.fromARGB(255, 69, 4, 122),
            ));
  }

  static ThemeData personaltheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.pink,
            background: Color.fromARGB(255, 255, 255, 255),
            onBackground: Color.fromARGB(255, 255, 254, 254),
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            secondary: Color.fromARGB(255, 163, 16, 231),
            onSecondary: Color.fromARGB(255, 221, 148, 255),
            onPrimaryContainer: Colors.pink));
  }
}

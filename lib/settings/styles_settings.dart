import 'package:flutter/material.dart';

class StyleSettings {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.pink,
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            background: Color.fromARGB(255, 255, 255, 255),
            onBackground: Color.fromARGB(255, 0, 0, 0),
            secondary: Color.fromARGB(255, 163, 16, 231),
            onSecondary: Color.fromARGB(255, 221, 148, 255),
            onPrimaryContainer: Colors.pink));
  }

  static ThemeData DarTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Color.fromARGB(255, 69, 4, 122),
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            background: Color.fromARGB(255, 0, 0, 0),
            onBackground: Color.fromARGB(255, 255, 255, 255),
            onPrimaryContainer: Color.fromARGB(255, 7, 255, 234)));
  }

  static ThemeData personaltheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.pink,
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            background: Color.fromARGB(255, 255, 255, 255),
            onBackground: Color.fromARGB(255, 0, 0, 0),
            secondary: Color.fromARGB(255, 163, 16, 231),
            onSecondary: Color.fromARGB(255, 221, 148, 255),
            onPrimaryContainer: Colors.pink));
  }
}

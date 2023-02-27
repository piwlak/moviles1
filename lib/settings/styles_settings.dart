import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StyleSettings {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        colorScheme:
            Theme.of(context).colorScheme.copyWith(primary: Colors.blue));
  }

  static ThemeData DarTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 0, 75, 65)));
  }
}

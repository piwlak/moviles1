import 'package:flutter/material.dart';
import 'package:moviles1/settings/styles_settings.dart';

import '../provider/theme_provider.dart';

class AppTheme {
  String title;
  IconData icon;
  ThemeData mode;

  AppTheme({required this.title, required this.icon, required this.mode});
}

List<AppTheme> appThemes = [
  AppTheme(
      title: 'Light',
      icon: Icons.brightness_5_rounded,
      mode: ThemeData().copyWith()),
  AppTheme(
      title: 'Dark',
      icon: Icons.brightness_2_rounded,
      mode: ThemeData().copyWith()),
  AppTheme(
      title: 'Auto',
      icon: Icons.brightness_4_rounded,
      mode: ThemeData().copyWith()),
];

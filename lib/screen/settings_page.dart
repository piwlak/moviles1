import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeSettings extends StatefulWidget {
  @override
  _ThemeSettingsState createState() => _ThemeSettingsState();
}

class _ThemeSettingsState extends State<ThemeSettings> {
  bool _isDarkMode = false;
  bool _isCustomMode = false;
  double _customBrightness = 0.5;
  late SharedPreferences _prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                ThemeProvider.controllerOf(context)
                    .setTheme('default_light_theme');
              },
              child: Text('cambio de tema')),
          TextButton(
              onPressed: () {
                ThemeProvider.controllerOf(context).setTheme('dark_theme');
              },
              child: Text('cambio de tema')),
          TextButton(
              onPressed: () {
                ThemeProvider.controllerOf(context).setTheme('custom_theme');
              },
              child: Text('cambio de tema')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_provider/theme_provider.dart';

import '../common/theme_helper.dart';
import '../widgets/appbar_widget.dart';

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
      appBar: Appbar_Widget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  'Sky'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onPressed: () {
                ThemeProvider.controllerOf(context)
                    .setTheme('default_light_theme');
              },
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  'Dark'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onPressed: () {
                ThemeProvider.controllerOf(context).setTheme('dark_theme');
              },
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  'Pink'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onPressed: () {
                ThemeProvider.controllerOf(context).setTheme('custom_theme');
              },
            ),
          ),
        ],
      ),
    );
  }
}

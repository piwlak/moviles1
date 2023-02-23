import 'dart:js';

import 'package:flutter/material.dart';
import 'package:moviles1/settings/styles_settings.dart';

class ThemeProvider with ChangeNotifier {
  //BuildContext context;
  ThemeData? _themeData;
  ThemeProvider(BuildContext context) {
    _themeData = StyleSettings.lightTheme(context);
  }

  getthemeData() => this._themeData;
  setthemeData(ThemeData theme) {
    this._themeData = theme;
    notifyListeners();
  }
}

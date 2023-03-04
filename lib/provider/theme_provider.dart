import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:moviles1/settings/styles_settings.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  ThemeProvider(BuildContext context) {
    _themeData = StyleSettings.personaltheme(context);
    //primarySwatch:Colors.blue;
  }

  getthemeData() => this._themeData;

  setthemeData(ThemeData theme) {
    this._themeData = theme;
    notifyListeners();
  }
}

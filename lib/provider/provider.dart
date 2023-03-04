import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviles1/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../settings/styles_settings.dart';

class Tema extends GetxController {
  late SharedPreferences preferences;

  String prefkey = "isDarkModeKey";

  void temaClaro() {
    Get.changeTheme(ThemeData.light());
    preferences.setBool(prefkey, false);
  }

  void temaOscuro() {
    Get.changeTheme(ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            error: Colors.red,
            onError: Colors.white,
            surface: Color.fromARGB(255, 69, 4, 122),
            onSurface: Colors.white,
            primary: Color.fromARGB(255, 69, 4, 122),
            onPrimary: Color.fromARGB(255, 3, 2, 2),
            background: Color.fromARGB(255, 0, 0, 0),
            onBackground: Color.fromARGB(255, 255, 255, 255),
            secondary: Color.fromARGB(255, 163, 16, 231),
            onSecondary: Color.fromARGB(255, 221, 148, 255),
            onPrimaryContainer: Color.fromARGB(255, 7, 255, 234))));
    preferences.setBool(prefkey, true);
  }

  void temaPersonalizado(BuildContext context) {
    Get.changeTheme(ThemeData(
        colorScheme: ColorScheme(
            error: Colors.red,
            onError: Colors.white,
            surface: Colors.pink,
            onSurface: Colors.white,
            brightness: Brightness.light,
            primary: Colors.pink,
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            background: Color.fromARGB(255, 255, 255, 255),
            onBackground: Color.fromARGB(255, 0, 0, 0),
            secondary: Color.fromARGB(255, 163, 16, 231),
            onSecondary: Color.fromARGB(255, 221, 148, 255),
            onPrimaryContainer: Colors.pink)));
  }

  @override
  void onInit() {
    cargarPreferencias().then((value) => cargarTema());

    super.onInit();
  }

  void cargarTema() {
    bool? isDarkMode = preferences.getBool(prefkey);

    if (isDarkMode == null) {
      preferences.setBool(prefkey, false);
      isDarkMode = false;
    }

    (isDarkMode) ? temaOscuro() : temaClaro();
  }

  Future<void> cargarPreferencias() async {
    preferences = await Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
  }
}

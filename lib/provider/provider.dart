import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tema extends GetxController {
  late SharedPreferences preferences;

  String prefkey = "isDarkModeKey";

  void temaClaro() {
    Get.changeTheme(ThemeData.light());
    preferences.setString(prefkey, "claro");
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
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            background: Color.fromARGB(255, 0, 0, 0),
            onBackground: Color.fromARGB(255, 255, 255, 255),
            secondary: Color.fromARGB(255, 163, 16, 231),
            onSecondary: Color.fromARGB(255, 221, 148, 255),
            onPrimaryContainer: Color.fromARGB(255, 7, 255, 234))));
    preferences.setString(prefkey, "oscuro");
  }

  void temaPersonalizado() {
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
    preferences.setString(prefkey, "personalizado");
  }

  @override
  void onInit() {
    cargarPreferencias().then((value) => cargarTema());

    super.onInit();
  }

  void cargarTema() {
    String? whichtheme = preferences.getString(prefkey);

    if (whichtheme == null) {
      preferences.setString(prefkey, "claro");
    }
    switch (whichtheme) {
      case "claro":
        temaClaro();
        break;
      case "oscuro":
        temaOscuro();
        break;
      case "personalizado":
        temaPersonalizado();
        break;
    }
  }

  Future<void> cargarPreferencias() async {
    preferences = await Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
  }
}

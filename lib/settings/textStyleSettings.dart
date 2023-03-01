import 'package:flutter/material.dart';

class TextStyleSettings {
  TextStyleSettings();

  Color? get textcolor => Colors.black;

  TextStyle get H2 => TextStyle(
      //fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.black54);

  TextStyle get b2 => TextStyle(
      //fontSize: 60,
      color: Colors.grey);

  TextStyle get buttontext => TextStyle(
      //fontSize: 60,
      fontWeight: FontWeight.bold);

  TextStyle get sbt => TextStyle(
      //fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.black54);

  //theme  dark

  TextStyle get H1d => TextStyle(
      //fontSize: 60,
      fontWeight: FontWeight.bold);

  TextStyle get H2d => TextStyle(
      //fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.black54);

  TextStyle get b2d => TextStyle(
      //fontSize: 60,
      color: Colors.black38);

  TextStyle get buttontextd => TextStyle(
      //fontSize: 60,
      fontWeight: FontWeight.bold);

  TextStyle get sbtd => TextStyle(
      //fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.black54);
}

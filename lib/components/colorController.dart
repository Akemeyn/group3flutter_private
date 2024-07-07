import 'package:flutter/material.dart';

class ColorController {
  static const Color jungleGreen = Color(0xFF32BD66);
  static const Color darkJungleGreen = Color(0xFF228B3F);
  static const Color lightJungleGreen = Color(0xFF66D98A);
  static const Color soDarkJungleGreen = Color.fromARGB(255, 23, 93, 42);

  static const Color grayNurse = Color(0xFFE6EAE7);
  static const Color darkGrayNurse = Color(0xFFBCC1BE);
  static const Color lightGrayNurse = Color(0xFFF1F4F2);

  static const Color hurricane = Color(0xFF867C7C);
  static const Color darkHurricane = Color(0xFF6C6464);
  static const Color lightHurricane = Color(0xFFA99F9F);

  static const Color tumbleweed = Color(0xFFD8AD7C);
  static const Color darkTumbleweed = Color(0xFFB08963);
  static const Color lightTumbleweed = Color(0xFFE8C69F);

  static const Map<String, Color> colors = {
    "jungleGreen": jungleGreen,
    "darkJungleGreen": darkJungleGreen,
    "lightJungleGreen": lightJungleGreen,
    "grayNurse": grayNurse,
    "darkGrayNurse": darkGrayNurse,
    "lightGrayNurse": lightGrayNurse,
    "hurricane": hurricane,
    "darkHurricane": darkHurricane,
    "lightHurricane": lightHurricane,
    "tumbleweed": tumbleweed,
    "darkTumbleweed": darkTumbleweed,
    "lightTumbleweed": lightTumbleweed,
  };

  static Color getColor(String colorName) {
    return colors[colorName] ?? Colors.black;
  }
}

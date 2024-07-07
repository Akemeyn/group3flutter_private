import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrijourney/components/colorController.dart';

class ComponentEditor {

  static SizedBox emptySpace(double number) => SizedBox(height: number);

  static TextStyle specialText(double number, Color color, [FontWeight? fontWeight]) {
    return GoogleFonts.notoSans(
      color: color,
      fontSize: number,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static OutlineInputBorder customInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
    );
  }

  static TextField textFieldInStart(String text, Icon icon) {
    return TextField(
      style: specialText(18, ColorController.soDarkJungleGreen, FontWeight.bold),
      decoration: InputDecoration(
        labelStyle: specialText(18, ColorController.soDarkJungleGreen),
        labelText: text,
        prefixIcon: icon,
        border: ComponentEditor.customInputBorder(),
        enabledBorder: ComponentEditor.customInputBorder(),
        focusedBorder: ComponentEditor.customInputBorder(),
        filled: true,
        fillColor: ColorController.soDarkJungleGreen.withOpacity(0.3),
      ),
    );
  }
}

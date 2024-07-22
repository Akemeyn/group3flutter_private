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

  static TextFormField textFieldInStart(String text, Icon icon, bool passwordVisible, TextInputType keyboardType,
      TextEditingController controller, String? Function(String?)? validator) {
    return TextFormField(
      style: specialText(18, ColorController.soDarkJungleGreen, FontWeight.bold),
      obscureText: passwordVisible,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
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

  static TextFormField passFieldInStart(String text, Icon icon, bool passwordVisible, TextInputType keyboardType,
      IconButton suffixIcon, TextEditingController controller, String? Function(String?)? validator) {
    return TextFormField(
      style: specialText(18, ColorController.soDarkJungleGreen, FontWeight.bold),
      obscureText: passwordVisible,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelStyle: specialText(18, ColorController.soDarkJungleGreen),
        labelText: text,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        border: ComponentEditor.customInputBorder(),
        enabledBorder: ComponentEditor.customInputBorder(),
        focusedBorder: ComponentEditor.customInputBorder(),
        filled: true,
        fillColor: ColorController.soDarkJungleGreen.withOpacity(0.3),
      ),
    );
  }

  static Container chatBotCard(double height, double width, String text, double textSize, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        color: ColorController.soDarkJungleGreen.withOpacity(0.8),
      ),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              text,
              style: ComponentEditor.specialText(textSize, Colors.white, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Icon(
              icon,
              size: 60,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  static Padding chatBotNutriMateText(String text, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: SizedBox(
                height: screenHeight * 0.060, child: const Image(image: AssetImage('assets/nutrimatelogo.png'))),
          ),
          Container(
            height: screenHeight * 0.1,
            width: screenWidth * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              color: ColorController.darkGrayNurse.withOpacity(0.8),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
              child: Text(
                text,
                style: ComponentEditor.specialText(18, Colors.black),
                /* textAlign: TextAlign.justify, */
              ),
            ),
          )
        ],
      ),
    );
  }

  static Padding chatBotUserText(String text, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.1,
            width: screenWidth * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              color: ColorController.darkJungleGreen.withOpacity(0.6),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
              child: Text(
                text,
                style: ComponentEditor.specialText(18, Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}

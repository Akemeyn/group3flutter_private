import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/screen/loginPart/loginScreen.dart';
import 'package:nutrijourney/screen/loginPart/registerScreen.dart';

import '../mainPart/chatBot.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorController.soDarkJungleGreen,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            opacity: 0.150,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Her diyet\nbir serüvendir',
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: screenHeight * 0.25),
              SizedBox(
                width: screenWidth * 0.85,
                height: screenHeight * 0.07,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const RegisterScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.white.withOpacity(0.4)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Serüvenine başla',
                    style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
                child: Text(
                  'Zaten bir hesabım var',
                  style: GoogleFonts.notoSans(fontSize: 16),
                ),
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
              ),
              SizedBox(height: screenHeight * 0.25),
            ],
          ),
        ),
      ),
    );
  }
}

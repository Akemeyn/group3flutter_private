import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/loginPart/welcomeScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: WelcomeScreen(),
    );
  }
}

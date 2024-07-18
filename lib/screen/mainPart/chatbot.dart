import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/componentEditor.dart';

import '../../components/colorController.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const String scenario1 = "Barkod Okutmak İstiyorum";
    const String scenario2 = "Kalori Hesaplamak İstiyorum";
    const String scenario3 = "Bana Bir Öğün Öner";
    const String scenario4 = "Günlük Su Miktarı Hesaplama";

    return Scaffold(
        body: Column(
      children: [
        Container(
          color: ColorController.soDarkJungleGreen,
          height: screenHeight * 0.12,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.05),
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    /* decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ), */
                    height: screenHeight * 0.1,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: Colors.white,
                      iconSize: screenHeight * 0.04,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.12, top: screenHeight * 0.04),
                child: Text(
                  "NutriMate",
                  style: ComponentEditor.specialText(32, Colors.white),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025, vertical: screenHeight * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  color: ColorController.soDarkJungleGreen.withOpacity(0.8),
                ),
                height: screenHeight * 0.3,
                width: screenWidth * 0.4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      Text(
                        scenario1,
                        style: ComponentEditor.specialText(24, Colors.white, FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ComponentEditor.chatBotCard(screenHeight * 0.3, screenWidth * 0.4, scenario2, 24, Icons.fastfood),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025, vertical: screenHeight * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ComponentEditor.chatBotCard(screenHeight * 0.3, screenWidth * 0.4, scenario3, 24, Icons.fastfood),
              ComponentEditor.chatBotCard(screenHeight * 0.3, screenWidth * 0.4, scenario4, 24, Icons.water_drop_outlined),
            ],
          ),
        )
      ],
    ));
  }
}

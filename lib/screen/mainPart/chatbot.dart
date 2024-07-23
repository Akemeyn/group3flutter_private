import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:awesome_number_picker/awesome_number_picker.dart';
import 'package:nutrijourney/screen/mainPart/barcodeScanner.dart';
import 'package:nutrijourney/screen/mainPart/calorieControl.dart';
import 'package:nutrijourney/screen/mainPart/tarif_anasayfa.dart';
import '../../components/colorController.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showText = false;
  bool showButtons = false;
  final int textDuration = 300;
  final int buttonDuration = 1000;
  final List<Widget> messages = [];
  double selectedWeight = 0.0;
  String sex = "";
  final ScrollController scrollController = ScrollController();

  String scenario1 = "Barkod Okutmak İstiyorum";
  String scenario2 = "Kalori Hesaplamak İstiyorum";
  String scenario3 = "Bana Bir Öğün Öner";
  String scenario4 = "Günlük Su Miktarı Hesaplama";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: textDuration), () {
      setState(() {
        showText = true;
        messages.add(ComponentEditor.chatBotNutriMateText("Merhaba ben NutriMate, size nasıl yardımcı olabilirim?",
            MediaQuery.of(context).size.width, MediaQuery.of(context).size.height));
        _scrollToBottom();
      });
      Future.delayed(Duration(milliseconds: buttonDuration), () {
        setState(() {
          showButtons = true;
        });
        addButtons();
      });
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void onCardTap(String scenario, double screenWidth, double screenHeight) {
    if (scenario == scenario1) {
      Get.to(() => const BarcodeScanner());
    } else if (scenario == scenario2) {
      Get.to(() => const CalorieControlScreen());
    } else if (scenario == scenario3) {
      Get.to(() => RecipeListScreen());
      //SPRINT 3 ICERISINDE DOLACAK
    } else if (scenario == scenario4) {
      setState(() {
        removeLastButtons();
        messages.add(ComponentEditor.chatBotUserText("Günlük ne kadar su içmem gerek?", screenWidth, screenHeight));
        showButtons = false;
        _scrollToBottom();
      });

      Future.delayed(Duration(milliseconds: buttonDuration), () {
        setState(() {
          messages.add(ComponentEditor.chatBotNutriMateText(
              "Lütfen kilonuzu giriniz...", MediaQuery.of(context).size.width, MediaQuery.of(context).size.height));
          messages.add(
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.3,
                  child: DecimalNumberPicker(
                    initialValue: 0,
                    minValue: 0,
                    maxValue: 200,
                    decimalPrecision: 1,
                    pickedItemTextStyle: ComponentEditor.specialText(24, Colors.white),
                    otherItemsTextStyle: ComponentEditor.specialText(24, Colors.white),
                    pickedItemDecoration: BoxDecoration(
                        color: ColorController.soDarkJungleGreen.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: ColorController.soDarkJungleGreen, width: 2)),
                    otherItemsDecoration: BoxDecoration(
                        color: ColorController.soDarkJungleGreen.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: ColorController.soDarkJungleGreen, width: 2)),
                    onChanged: (value) {
                      setState(() => selectedWeight = value);
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        messages.removeLast();
                        messages
                            .add(ComponentEditor.chatBotUserText("$selectedWeight kiloyum", screenWidth, screenHeight));
                        messages.add(ComponentEditor.chatBotNutriMateText(
                            "Cinsiyetinizi öğrenebilir miyim?", screenWidth, screenHeight));
                        messages.add(Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.woman,
                                  size: screenHeight * 0.1,
                                  color: ColorController.soDarkJungleGreen.withOpacity(0.8),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        sex = "Kadın";
                                        messages.removeLast();
                                        messages
                                            .add(ComponentEditor.chatBotUserText("Kadınım", screenWidth, screenHeight));
                                        messages.add(ComponentEditor.chatBotNutriMateText(
                                            "Günlük aktivitenizi 1 ile 5 arasında seçer misiniz?",
                                            screenWidth,
                                            screenHeight));
                                      });
                                      _scrollToBottom();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all<Color>(
                                        ColorController.soDarkJungleGreen.withOpacity(0.8),
                                      ),
                                    ),
                                    child: Text(
                                      "Kadın",
                                      style: ComponentEditor.specialText(24, Colors.white),
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.man,
                                  size: screenHeight * 0.1,
                                  color: ColorController.soDarkJungleGreen.withOpacity(0.8),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        sex = "Erkek";
                                        messages.removeLast();
                                        messages
                                            .add(ComponentEditor.chatBotUserText("Erkeğim", screenWidth, screenHeight));
                                        messages.add(ComponentEditor.chatBotNutriMateText(
                                            "Günlük aktivitenizi 1 ile 5 arasında seçer misiniz?",
                                            screenWidth,
                                            screenHeight));
                                      });
                                      _scrollToBottom();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all<Color>(
                                        ColorController.soDarkJungleGreen.withOpacity(0.8),
                                      ),
                                    ),
                                    child: Text(
                                      "Erkek",
                                      style: ComponentEditor.specialText(24, Colors.white),
                                    ))
                              ],
                            )
                          ],
                        ));
                        _scrollToBottom();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        ColorController.soDarkJungleGreen.withOpacity(0.8),
                      ),
                    ),
                    child: const Icon(
                      Icons.check_box_outlined,
                      color: Colors.white,
                      size: 32,
                    )),
              ],
            ),
          );
        });
      });
    }
  }

  void removeLastButtons() {
    if (messages.isNotEmpty) {
      messages.removeLast();
    }
    if (messages.isNotEmpty) {
      messages.removeLast();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorController.soDarkJungleGreen,
        title: Text(
          "NutriMate",
          style: ComponentEditor.specialText(32, Colors.white),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.025),
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
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: messages,
        ),
      ),
    );
  }

  void addButtons() {
    setState(() {
      messages.add(
        AnimatedOpacity(
          opacity: showButtons ? 1.0 : 0.0,
          duration: Duration(milliseconds: buttonDuration),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    onCardTap(scenario1, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
                  },
                  child: ComponentEditor.chatBotCard(MediaQuery.of(context).size.height * 0.3,
                      MediaQuery.of(context).size.width * 0.4, scenario1, 24, Icons.camera_alt_outlined),
                ),
                GestureDetector(
                  onTap: () {
                    onCardTap(scenario2, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
                  },
                  child: ComponentEditor.chatBotCard(MediaQuery.of(context).size.height * 0.3,
                      MediaQuery.of(context).size.width * 0.4, scenario2, 24, Icons.calculate_outlined),
                ),
              ],
            ),
          ),
        ),
      );
      messages.add(
        AnimatedOpacity(
          opacity: showButtons ? 1.0 : 0.0,
          duration: Duration(milliseconds: buttonDuration),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    onCardTap(scenario3, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
                  },
                  child: ComponentEditor.chatBotCard(MediaQuery.of(context).size.height * 0.3,
                      MediaQuery.of(context).size.width * 0.4, scenario3, 24, Icons.fastfood_outlined),
                ),
                GestureDetector(
                  onTap: () {
                    onCardTap(scenario4, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
                  },
                  child: ComponentEditor.chatBotCard(MediaQuery.of(context).size.height * 0.3,
                      MediaQuery.of(context).size.width * 0.4, scenario4, 24, Icons.water_drop_outlined),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

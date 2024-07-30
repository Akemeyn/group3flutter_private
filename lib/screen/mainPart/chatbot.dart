import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:awesome_number_picker/awesome_number_picker.dart';
import 'package:nutrijourney/components/pageConttoller.dart';
import 'package:nutrijourney/screen/assistantPart/barcodeScanner.dart';
import 'package:nutrijourney/screen/assistantPart/calorieControl.dart';
import 'package:nutrijourney/screen/assistantPart/recipeList.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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
  int activityLevel = 0;
  final ScrollController scrollController = ScrollController();

  String selectedMealType = "";
  String selectedFlavorType = "";
  String selectedCookingType = "";
  String selectedDietType = "";
  String selectedPortion = "";
  final List<String> mealTypes = ['Kahvaltı', 'Öğle Yemeği', 'Akşam Yemeği', 'Atıştırmalık'];
  final List<String> flavorTypes = ['Tatlı', 'Acı - Baharatlı', 'Tuzlu', 'Ekşi', "NutriMate karar versin"];
  final List<String> cookingTypes = ['Fırın', 'Haşlama', 'Soteleme', 'Izgara', "Kızartma", "NutriMate karar versin"];
  final List<String> dietTypes = ['Vegan', 'Vejeteryan', 'Laktozsuz', 'Glutensiz', "NutriMate karar versin"];
  final List<String> portionTypes = ['1', '2', '3', '4', "5+", "NutriMate karar versin"];

  //scenarios
  String scenario1 = "Barkod Okutmak İstiyorum";
  String scenario2 = "Kalori Hesaplamak İstiyorum";
  String scenario3 = "Bana Bir Öğün Öner";
  String scenario4 = "Günlük Su Miktarı Hesaplama";

  final List<String> activityDescriptions = [
    "Hiç hareket etmiyorum",
    "Az hareket ediyorum",
    "Orta seviyede hareket ediyorum",
    "Çok hareket ediyorum",
    "Aşırı hareket ediyorum"
  ];

  void calculateWaterIntake(double screenWidth, double screenHeight) {
    double waterIntake;
    if (sex == "Kadın") {
      waterIntake = selectedWeight * 0.033;
    } else {
      waterIntake = selectedWeight * 0.035;
    }

    // Aktivite seviyesine göre ekleme yap
    waterIntake += activityLevel * 0.2;

    messages.add(ComponentEditor.chatBotNutriMateText(
        "Günlük su ihtiyacınız yaklaşık olarak ${waterIntake.toStringAsFixed(2)} litre.", screenWidth, screenHeight));
    _scrollToBottom();
  }

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
      //Get.to(() => const CalorieControlScreen());
    } else if (scenario == scenario3) {
      setState(() {
        removeLastWidgets(2);
        messages.add(ComponentEditor.chatBotUserText("Bana bir öğün önermeni istiyorum.", screenWidth, screenHeight));
        showButtons = false;
        Future.delayed(Duration(milliseconds: buttonDuration), () {
          setState(() {
            messages.add(ComponentEditor.chatBotNutriMateText("Nasıl bir yemek türü istiyorsunuz?",
                MediaQuery.of(context).size.width, MediaQuery.of(context).size.height));
            messages.add(Column(
              children: mealTypes.asMap().entries.map((entry) {
                int idx = entry.key;
                String mealType = entry.value;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        ColorController.soDarkJungleGreen.withOpacity(0.8),
                      ),
                    ),
                    onPressed: () => _onMealTypeSelected(idx),
                    child: Text(
                      mealType,
                      style: ComponentEditor.specialText(24, Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ));
            _scrollToBottom();
          });
        });
      });
    } else if (scenario == scenario4) {
      setState(() {
        removeLastWidgets(2);
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
                                        messages.add(Column(
                                          children: List.generate(5, (index) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  activityLevel = index + 1;
                                                  messages.removeLast();
                                                  messages.add(ComponentEditor.chatBotUserText(
                                                      "Günlük aktivite seviyem: ${index + 1} - ${activityDescriptions[index]}",
                                                      screenWidth,
                                                      screenHeight));
                                                  calculateWaterIntake(screenWidth, screenHeight);
                                                });
                                                _scrollToBottom();
                                              },
                                              child: Text(
                                                "${index + 1} - ${activityDescriptions[index]}",
                                                style: ComponentEditor.specialText(18, Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor: WidgetStateProperty.all<Color>(
                                                  ColorController.soDarkJungleGreen.withOpacity(0.8),
                                                ),
                                              ),
                                            );
                                          }),
                                        ));
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
                                        messages.add(Column(
                                          children: List.generate(5, (index) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  activityLevel = index + 1;
                                                  messages.removeLast();
                                                  messages.add(ComponentEditor.chatBotUserText(
                                                      "Günlük aktivite seviyem: ${index + 1} - ${activityDescriptions[index]}",
                                                      screenWidth,
                                                      screenHeight));
                                                  calculateWaterIntake(screenWidth, screenHeight);
                                                });
                                                _scrollToBottom();
                                              },
                                              child: Text(
                                                "${index + 1} - ${activityDescriptions[index]}",
                                                style: ComponentEditor.specialText(18, Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor: WidgetStateProperty.all<Color>(
                                                  ColorController.soDarkJungleGreen.withOpacity(0.8),
                                                ),
                                              ),
                                            );
                                          }),
                                        ));
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

  void removeLastWidgets(int howMuch) {
    for (var i = 0; i < howMuch; i++) {
      messages.removeLast();
    }
  }

  @override
  Widget build(BuildContext context) {
    final PageControllerManager pageControllerManager = Get.find();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorController.soDarkJungleGreen,
        title: Text(
          "NutriMate",
          style: ComponentEditor.specialText(screenHeight * 0.03, Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () {
            if (pageControllerManager.selectedIndex.value > 0) {
              pageControllerManager.changePage(0);
            }
          },
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

  void _onMealTypeSelected(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    selectedMealType = mealTypes[index];
    setState(() {
      removeLastWidgets(1);
      messages.add(ComponentEditor.chatBotUserText("$selectedMealType istiyorum.", screenWidth, screenHeight));
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          messages.add(ComponentEditor.chatBotNutriMateText("Tat seçimi yapar mısınız?", screenWidth, screenHeight));
          messages.add(Column(
            children: flavorTypes.asMap().entries.map((entry) {
              int idx = entry.key;
              String flavorType = entry.value;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      ColorController.soDarkJungleGreen.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () => _onFlavorTypeSelected(idx),
                  child: Text(
                    flavorType,
                    style: ComponentEditor.specialText(24, Colors.white),
                  ),
                ),
              );
            }).toList(),
          ));
          _scrollToBottom();
        });
      });
    });
  }

  void _onFlavorTypeSelected(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    selectedFlavorType = flavorTypes[index];
    String text = "";
    if (selectedFlavorType == "NutriMate karar versin") {
      text = "Sana bırakıyorum.";
    } else {
      text = "$selectedFlavorType istiyorum.";
    }
    setState(() {
      removeLastWidgets(1);
      messages.add(ComponentEditor.chatBotUserText(text, screenWidth, screenHeight));
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          messages
              .add(ComponentEditor.chatBotNutriMateText("Pişirme seçimi yapar mısınız?", screenWidth, screenHeight));
          messages.add(Column(
            children: cookingTypes.asMap().entries.map((entry) {
              int idx = entry.key;
              String cookingType = entry.value;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      ColorController.soDarkJungleGreen.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () => _onCookingTypeSelected(idx),
                  child: Text(
                    cookingType,
                    style: ComponentEditor.specialText(24, Colors.white),
                  ),
                ),
              );
            }).toList(),
          ));
          _scrollToBottom();
        });
      });
    });
  }

  void _onCookingTypeSelected(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    selectedCookingType = cookingTypes[index];
    String text = "";
    if (selectedCookingType == "NutriMate karar versin") {
      text = "Sana bırakıyorum.";
    } else {
      text = "$selectedCookingType istiyorum.";
    }
    setState(() {
      removeLastWidgets(1);
      messages.add(ComponentEditor.chatBotUserText(text, screenWidth, screenHeight));
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          messages
              .add(ComponentEditor.chatBotNutriMateText("Özel istek seçimi yapar mısınız?", screenWidth, screenHeight));
          messages.add(Column(
            children: dietTypes.asMap().entries.map((entry) {
              int idx = entry.key;
              String dietType = entry.value;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      ColorController.soDarkJungleGreen.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () => _onDietTypeSelected(idx),
                  child: Text(
                    dietType,
                    style: ComponentEditor.specialText(24, Colors.white),
                  ),
                ),
              );
            }).toList(),
          ));
          _scrollToBottom();
        });
      });
    });
  }

  void _onDietTypeSelected(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    selectedDietType = dietTypes[index];
    String text = "";
    if (selectedDietType == "NutriMate karar versin") {
      text = "Sana bırakıyorum.";
    } else {
      text = "$selectedDietType istiyorum.";
    }
    setState(() {
      removeLastWidgets(1);
      messages.add(ComponentEditor.chatBotUserText(text, screenWidth, screenHeight));
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          messages.add(ComponentEditor.chatBotNutriMateText("Kaç kişilik bir tarif olsun?", screenWidth, screenHeight));
          messages.add(Column(
            children: portionTypes.asMap().entries.map((entry) {
              int idx = entry.key;
              String portionType = entry.value;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      ColorController.soDarkJungleGreen.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () => _onPortionTypeSelected(idx),
                  child: Text(
                    portionType,
                    style: ComponentEditor.specialText(24, Colors.white),
                  ),
                ),
              );
            }).toList(),
          ));
          _scrollToBottom();
        });
      });
    });
  }

  void _onPortionTypeSelected(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    selectedPortion = portionTypes[index];
    String text = "";
    if (selectedPortion == "NutriMate karar versin") {
      text = "Sana bırakıyorum.";
    } else {
      text = "$selectedPortion kişilik olsun.";
    }
    setState(() {
      removeLastWidgets(1);
      messages.add(ComponentEditor.chatBotUserText(text, screenWidth, screenHeight));
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          messages.add(ComponentEditor.chatBotNutriMateText("Tarifleriniz hazırlanıyor...", screenWidth, screenHeight));
          _scrollToBottom();
        });
      });

      generateResponse().then((response) {
        Get.to(() => RecipeListScreen(recipesJson: response));
      });
    });
  }

  Future<String> generateResponse() async {
    String mealType = selectedMealType != "NutriMate karar versin" ? selectedMealType : "";
    String flavorType = selectedFlavorType != "NutriMate karar versin" ? selectedFlavorType : "";
    String cookingType = selectedCookingType != "NutriMate karar versin" ? selectedCookingType : "";
    String dietType = selectedDietType != "NutriMate karar versin" ? selectedDietType : "";
    String portion = selectedPortion != "NutriMate karar versin" ? selectedPortion : "";

    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: 'AIzaSyBxc-GDn-WWrc0PFwBmDECQwdWwBY_k5qo');

    String prompt = '''
  Sadece name, ingredients ve construction'ı doldurup bana JSON formatında geri doldur, bu şekilde bana 6 farklı tarif öner
  {
    "meal_type": "$mealType",
    "flavor_type": "$flavorType",
    "cooking_type": "$cookingType",
    "diet_type": "$dietType",
    "portion": "$portion",
    "name": "",
    "ingredients": "",
    "construction": ""
  }
  ''';

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    return response.text!;
  }
}

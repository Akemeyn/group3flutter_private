import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:nutrijourney/screen/assistantPart/calorieControl.dart';

class RecipePage extends StatelessWidget {
  final String name;
  final String ingredients;
  final String construction;
  final String protein;
  final String carbs;
  final String fat;
  final String imageUrl;
  final String calories;

  const RecipePage({
    super.key,
    required this.name,
    this.ingredients = '',
    this.construction = '',
    this.protein = '',
    this.carbs = '',
    this.fat = '',
    this.imageUrl = 'https://via.placeholder.com/150',
    this.calories = '',
  });

  @override
  Widget build(BuildContext context) {
    List<String> ingredientList = ingredients.split(', ');
    List<String> constructionList = construction.split(',,, ');
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorController.soDarkJungleGreen,
        title: Text(
          name,
          style: ComponentEditor.specialText(24, Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: screenHeight * 0.26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              /* Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ), */
              const Text(
                'Malzemeler:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...ingredientList.map((ingredient) => Text(
                    "$ingredient",
                    style: ComponentEditor.specialText(16, Colors.black),
                  )),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Yapılışı:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...constructionList
                      .asMap()
                      .entries
                      .map((entry) => Text(
                            '${entry.key + 1}- ${entry.value}',
                            style: ComponentEditor.specialText(16, Colors.black),
                          ))
                      .toList(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorController.darkJungleGreen.withOpacity(0.8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                  onPressed: () {
                    Get.to(() => CalorieControlScreen(
                          protein: protein,
                          carbs: carbs,
                          fat: fat,
                          imageUrl: imageUrl,
                          calories: calories,
                          name: name,
                        ));
                  },
                  child: Text(
                    'Kaloriyi kontrol et',
                    style: ComponentEditor.specialText(20, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

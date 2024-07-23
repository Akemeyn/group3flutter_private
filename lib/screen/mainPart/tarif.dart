import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:nutrijourney/screen/mainPart/calorieControl.dart';

class RecipePage extends StatelessWidget {
  final String name;
  final String ingredients;
  final String construction;

  const RecipePage({
    super.key,
    required this.name,
    required this.ingredients,
    required this.construction,
  });

  @override
  Widget build(BuildContext context) {
    // Malzemeleri ve yapılış adımlarını virgülle ayırarak listeye dönüştür
    List<String> ingredientList = ingredients.split(', ');
    List<String> constructionList = construction.split('. ');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Like button functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://cdn.yemek.com/mnresize/940/940/uploads/2023/03/iki-renkli-kek-onecikan.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const CalorieControlScreen()); // Navigate to CalorieControlScreen
                },
                child: const Text('Kaloriyi kontrol et'),
              ),
              const SizedBox(height: 20),
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
                  Text(
                    constructionList.asMap().entries.map((entry) {
                      int idx = entry.key + 1;
                      String step = entry.value.trim();
                      return "$step. ";
                    }).join(""),
                    style: ComponentEditor.specialText(16, Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

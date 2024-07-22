import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/screen/mainPart/calorieControl.dart';
// Import GetX for navigation

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'Kakaolu kek',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() =>
                    const CalorieControlScreen()); // Navigate to RecipeListScreen
              },
              child: const Text('Kaloriyi kontrol et'),
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Yemek Tarifi\n\nMalzemeler:\n- 2 su bardağı un\n- 1 su bardağı şeker\n- 1/2 su bardağı sıvı yağ\n- 3 adet yumurta\n- 1 su bardağı süt\n- 1 paket kabartma tozu\n- 1 paket vanilya\n\nYapılışı:\n1. Bir kapta yumurta ve şekeri köpürene kadar çırpın.\n2. Sıvı yağ ve sütü ekleyip karıştırmaya devam edin.\n3. Un, kabartma tozu ve vanilyayı ekleyip pürüzsüz bir hamur elde edene kadar karıştırın.\n4. Yağlanmış kek kalıbına hamuru dökün.\n5. Önceden ısıtılmış 180 derece fırında 30-35 dakika pişirin. Kürdan testi yaparak piştiğini kontrol edin.\n6. Kek soğuduktan sonra dilimleyerek servis yapın.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

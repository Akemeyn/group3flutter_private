import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nutrijourney/screen/mainPart/mainScreen.dart';
import 'package:nutrijourney/screen/mainPart/profile.dart';
import 'package:nutrijourney/screen/mainPart/tarif_anasayfa.dart';

class CalorieControlScreen extends StatefulWidget {
  const CalorieControlScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalorieControlScreenState createState() => _CalorieControlScreenState();
}

class _CalorieControlScreenState extends State<CalorieControlScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Buraya ilgili navigasyon veya state güncelleme mantığını ekleyebilirsiniz
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Control'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Geri düğmesi işlevi
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Menü düğmesi işlevi
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              'https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712665_1280.jpg', // Bu URL'yi kendi resminizle değiştirin
              height: 200,
            ),
            const SizedBox(height: 16),
            const Text(
              'Somon Fish',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'High protein main meal',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const NutrientInfoBar(
              nutrient: 'Protein',
              amount: 9.7,
              color: Colors.green,
              maxAmount: 10,
            ),
            const NutrientInfoBar(
              nutrient: 'Carbs',
              amount: 4.3,
              color: Colors.orange,
              maxAmount: 10,
            ),
            const NutrientInfoBar(
              nutrient: 'Fat',
              amount: 1.2,
              color: Colors.purple,
              maxAmount: 10,
            ),
            const SizedBox(height: 16),
            const Text(
              'Total',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              '104.6 calories',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Detay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          switch (index) {
            case 0:
              Get.to(() => const HomeScreen());
              break;
            case 1:
              Get.to(() => const RecipeListScreen());
              break;
            case 2:
              Get.to(() => const ProfileScreen());
              break;
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class NutrientInfoBar extends StatelessWidget {
  final String nutrient;
  final double amount;
  final Color color;
  final double maxAmount;

  const NutrientInfoBar({
    super.key,
    required this.nutrient,
    required this.amount,
    required this.color,
    required this.maxAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nutrient,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 34, 28, 28),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                width: (amount / maxAmount) * MediaQuery.of(context).size.width,
                height: 24,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Positioned(
                right: 8,
                top: 4,
                child: Text(
                  '${amount.toStringAsFixed(1)} g',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

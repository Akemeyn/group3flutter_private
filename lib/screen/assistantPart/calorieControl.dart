import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';

class CalorieControlScreen extends StatelessWidget {
  final String protein;
  final String carbs;
  final String fat;
  final String imageUrl;
  final String calories;
  final String name;

  const CalorieControlScreen({
    super.key,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.imageUrl,
    required this.calories,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorController.soDarkJungleGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              imageUrl,
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: ComponentEditor.specialText(24, Colors.black, FontWeight.bold),
            ),
            const SizedBox(height: 16),
            NutrientInfoBar(
              nutrient: 'Protein',
              amount: double.parse(protein),
              color: Colors.green,
              maxAmount: 50,
            ),
            NutrientInfoBar(
              nutrient: 'Karbonhidrat',
              amount: double.parse(carbs),
              color: Colors.orange,
              maxAmount: 50,
            ),
            NutrientInfoBar(
              nutrient: 'Yağ',
              amount: double.parse(fat),
              color: Colors.purple,
              maxAmount: 50,
            ),
            const SizedBox(height: 16),
            const Text(
              'Toplam',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              calories,
              style: ComponentEditor.specialText(20, Colors.black),
            ),
          ],
        ),
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

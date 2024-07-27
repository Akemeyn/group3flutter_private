import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';

class CalorieControlScreen extends StatelessWidget {
  const CalorieControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorController.soDarkJungleGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,),
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
              'https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712665_1280.jpg', // Bu URL'yi kendi resminizle değiştirin
              height: 200,
            ),
            const SizedBox(height: 16),
            const Text(
              'Somon Balığı',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Yüksek proteinli ana yemek',
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
              nutrient: 'Karbonhidrat',
              amount: 4.3,
              color: Colors.orange,
              maxAmount: 10,
            ),
            const NutrientInfoBar(
              nutrient: 'Yağ',
              amount: 1.2,
              color: Colors.purple,
              maxAmount: 10,
            ),
            const SizedBox(height: 16),
            const Text(
              'Toplam',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              '104.6 kalori',
              style: TextStyle(fontSize: 16, color: Colors.grey),
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

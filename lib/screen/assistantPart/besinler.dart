import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:nutrijourney/screen/assistantPart/calorieControl.dart';

class NutrimateScreen extends StatefulWidget {
  const NutrimateScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NutrimateScreenState createState() => _NutrimateScreenState();
}

class _NutrimateScreenState extends State<NutrimateScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NutriMate Önerileri',
          style: ComponentEditor.specialText(screenHeight * 0.03, Colors.white),
        ),
        centerTitle: true,
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
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 6, // 2*3'lük grid için
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => const CalorieControlScreen());
              },
              child: NutrimateItem(
                imageUrl: 'https://via.placeholder.com/150', // Görsel için URL
                foodName: 'Besin Adı $index',
              ),
            );
          },
        ),
      ),
    );
  }
}

class NutrimateItem extends StatelessWidget {
  final String imageUrl;
  final String foodName;

  const NutrimateItem({super.key, required this.imageUrl, required this.foodName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              foodName,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

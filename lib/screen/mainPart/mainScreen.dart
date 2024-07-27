import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/screen/mainPart/besinler.dart';
import 'package:nutrijourney/screen/mainPart/chatbot.dart';
import 'package:nutrijourney/screen/mainPart/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> healthyFoods = [
    {
      'title': 'Avokado Tostu',
      'calories': '140 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Sebze Karışımı',
      'calories': '260 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Yulaf Ezmesi',
      'calories': '200 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Yoğurt',
      'calories': '100 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Meyve Tabağı',
      'calories': '150 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Somon',
      'calories': '220 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
  ];

  final List<Map<String, String>> newFoods = [
    {
      'title': 'Sebze Karışımı',
      'calories': '260 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Quinoa Salatası',
      'calories': '250 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Chia Pudding',
      'calories': '180 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Tavuk Göğsü',
      'calories': '210 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Humus',
      'calories': '150 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Kinoa',
      'calories': '230 kcal',
      'imageUrl': 'https://via.placeholder.com/150'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sağlıklı Besinler Bölümü
              const Text(
                'Sağlıklı Besinler',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: healthyFoods.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FoodCard(
                        title: healthyFoods[index]['title']!,
                        calories: healthyFoods[index]['calories']!,
                        imageUrl: healthyFoods[index]['imageUrl']!,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),

              // Yeni Besinler Bölümü
              const Text(
                'Yeni Besinler',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newFoods.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FoodCard(
                        title: newFoods[index]['title']!,
                        calories: newFoods[index]['calories']!,
                        imageUrl: newFoods[index]['imageUrl']!,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),

              // Nutrimate's Recommended Section
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const NutrimateScreen());
                  },
                  icon: const Icon(Icons.food_bank, color: Colors.white),
                  label: const Text(
                    'Nutrimate\'in Önerdikleri',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Nutrimate',
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
              Get.to(() => const ChatScreen());
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

class FoodCard extends StatelessWidget {
  final String title;
  final String calories;
  final String imageUrl;

  const FoodCard({
    super.key,
    required this.title,
    required this.calories,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 150,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.local_fire_department, size: 16.0),
                    const SizedBox(width: 4.0),
                    Text(calories),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

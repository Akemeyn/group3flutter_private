import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nutrijourney/screen/mainPart/chatbot.dart';
import 'package:nutrijourney/screen/mainPart/tarif_anasayfa.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 16.0),

              // Healthy Food Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nutrimate',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Sağlıklı Yaşam İçin Yapay Zekamızdan Yardım Alabilirsin',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(() => const ChatScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Background color
                              foregroundColor: Colors.white, // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('-> Nutrimate <-'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Image.network(
                      'https://via.placeholder.com/50',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // New Food Section
              const Text(
                'New Food',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              const SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: FoodCard(
                        title: 'Avocado toast',
                        price: '\$18.00',
                        calories: '140 kcal',
                        imageUrl: 'https://via.placeholder.com/150',
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: FoodCard(
                        title: 'Vegetable mix',
                        price: '\$22.50',
                        calories: '260 kcal',
                        imageUrl: 'https://via.placeholder.com/150',
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: FoodCard(
                        title: 'Vegetable mix',
                        price: '\$22.50',
                        calories: '260 kcal',
                        imageUrl: 'https://via.placeholder.com/150',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Popular Food Section
              const Text(
                'Popular Food',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              const FoodCard(
                title: 'Seasonal salad',
                price: '\$14.50',
                calories: '120 kcal',
                imageUrl: 'https://via.placeholder.com/150',
              ),
            ],
          ),
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
              // Get.to(() => ProfilScreen());
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
  final String price;
  final String calories;
  final String imageUrl;

  const FoodCard({
    super.key,
    required this.title,
    required this.price,
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
            width: double.infinity,
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
                Text(price),
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

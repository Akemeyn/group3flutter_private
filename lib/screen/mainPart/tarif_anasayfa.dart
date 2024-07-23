import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/screen/mainPart/mainScreen.dart';
import 'package:nutrijourney/screen/mainPart/profile.dart';
import 'package:nutrijourney/screen/mainPart/tarif.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  int _selectedIndex = 1;
  String _selectedFilter = 'Tümü';

  final List<Map<String, String>> _recipes = [
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Sabah Tarif 1',
      'time': 'Sabah'
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Sabah Tarif 2',
      'time': 'Sabah'
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Öğle Tarif 1',
      'time': 'Öğle'
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Öğle Tarif 2',
      'time': 'Öğle'
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Akşam Tarif 1',
      'time': 'Akşam'
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'title': 'Akşam Tarif 2',
      'time': 'Akşam'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
  }

  List<Map<String, String>> get _filteredRecipes {
    if (_selectedFilter == 'Tümü') {
      return _recipes;
    } else {
      return _recipes
          .where((recipe) => recipe['time'] == _selectedFilter)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarifler'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => const HomeScreen());
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(
                  label: 'Tümü',
                  isSelected: _selectedFilter == 'Tümü',
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'Tümü';
                    });
                  },
                ),
                FilterButton(
                  label: 'Sabah',
                  isSelected: _selectedFilter == 'Sabah',
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'Sabah';
                    });
                  },
                ),
                FilterButton(
                  label: 'Öğle',
                  isSelected: _selectedFilter == 'Öğle',
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'Öğle';
                    });
                  },
                ),
                FilterButton(
                  label: 'Akşam',
                  isSelected: _selectedFilter == 'Akşam',
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'Akşam';
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              padding: const EdgeInsets.all(10.0),
              itemCount: _filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = _filteredRecipes[index];
                return GestureDetector(
                  onTap: () {
                    if (index == 3) {
                      Get.to(() => const RecipePage());
                    }
                  },
                  child: RecipeCard(
                    imageUrl: recipe['imageUrl']!,
                    title: recipe['title']!,
                  ),
                );
              },
            ),
          ),
        ],
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
        onTap: _onItemTapped,
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blueAccent : Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RecipeCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
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
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

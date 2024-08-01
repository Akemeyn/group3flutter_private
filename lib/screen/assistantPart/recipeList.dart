import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/screen/mainPart/mainScreen.dart';
import 'package:nutrijourney/screen/assistantPart/recipe.dart';

class RecipeListScreen extends StatefulWidget {
  final String recipesJson;

  const RecipeListScreen({super.key, required this.recipesJson});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  String _selectedFilter = 'Tümü';
  late List<Map<String, String>> _recipes;

  @override
  void initState() {
    super.initState();
    try {
      _recipes = parseRecipesFromResponse(widget.recipesJson);
    } catch (e) {
      // Hata durumunda boş liste atayabiliriz veya hata mesajı gösterebiliriz.
      _recipes = [];
    }
  }

  List<Map<String, String>> parseRecipesFromResponse(String responseText) {
    final regex = RegExp(r'\{[^}]+\}');
    final matches = regex.allMatches(responseText);

    final List<Map<String, String>> recipes = matches.map((match) {
      final jsonString = match.group(0)!;
      final Map<String, dynamic> jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      return {
        'name': jsonMap['name']?.toString() ?? '',
        'ingredients': jsonMap['ingredients']?.toString() ?? '',
        'construction': jsonMap['construction']?.toString() ?? '',
      };
    }).toList();

    return recipes;
  }

  List<Map<String, String>> get _filteredRecipes {
    if (_selectedFilter == 'Tümü') {
      return _recipes;
    } else {
      return _recipes.where((recipe) => recipe['time'] == _selectedFilter).toList();
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
                    Get.to(() => RecipePage(
                          name: recipe['name']!,
                          ingredients: recipe['ingredients']!,
                          construction: recipe['construction']!,
                        ));
                  },
                  child: RecipeCard(
                    title: recipe['name']!,
                    imageUrl: 'http://via.placeholder.com/150',
                  ),
                );
              },
            ),
          ),
        ],
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

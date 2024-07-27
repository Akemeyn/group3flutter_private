import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/pageConttoller.dart';
import 'package:nutrijourney/screen/mainPart/profile_edit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageControllerManager pageControllerManager = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorController.soDarkJungleGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            if (pageControllerManager.selectedIndex.value > 0) {
              pageControllerManager.changePage(0);
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            const Text(
              'Merhaba ......',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Boy: ....',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        'Kilo: ....',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Sağlık Durumun :',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '.........',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ProfileEditScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              ),
              child: const Text(
                'Profili Düzenle',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              ),
              child: const Text(
                '....................',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              ),
              child: const Text(
                'Çıkış Yap',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

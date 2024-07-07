import 'package:flutter/material.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorController.lightJungleGreen,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: ColorController.darkJungleGreen,size: 32,),onPressed: () => Get.back(),),
        centerTitle: true,
        backgroundColor: ColorController.lightJungleGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorController.darkJungleGreen,
                border: ComponentEditor.customInputBorder(),
                enabledBorder: ComponentEditor.customInputBorder(),
                focusedBorder: ComponentEditor.customInputBorder(),
                labelText: 'Kullanıcı Adı',
                labelStyle: ComponentEditor.specialText(20, Colors.white),
              ),
            ),
            ComponentEditor.emptySpace(20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorController.darkJungleGreen,
                border: ComponentEditor.customInputBorder(),
                enabledBorder: ComponentEditor.customInputBorder(),
                focusedBorder: ComponentEditor.customInputBorder(),
                labelText: 'Şifre',
                labelStyle: ComponentEditor.specialText(20, Colors.white),
              ),
              obscureText: true,
            ),
            ComponentEditor.emptySpace(20),
            TextButton(
              onPressed: () {
                // Forgot Password butonuna tıklanınca yapılacak işlemler
              },
              child: const Text('Forgot Password?'),
            ),
            ElevatedButton(
              onPressed: () {
                // Login butonuna tıklanınca yapılacak işlemler
              },
              child: const Text('Login'),
              
            ),
            
          ],
        ),
      ),
    );
  }
}

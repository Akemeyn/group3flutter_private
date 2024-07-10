import 'package:flutter/material.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double _keyboardVisibleHeight = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    _keyboardVisibleHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorController.soDarkJungleGreen,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/loginScreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(top: screenHeight * 0.4 - _keyboardVisibleHeight * 0.26),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Tekrar Hoşgeldin",
                    style: ComponentEditor.specialText(40, ColorController.soDarkJungleGreen, FontWeight.bold)),
                ComponentEditor.emptySpace(screenHeight * 0.005),
                Text("Serüvenine kaldığın yerden devam et",
                    style: ComponentEditor.specialText(16, ColorController.soDarkJungleGreen)),
                ComponentEditor.emptySpace(screenHeight * 0.05),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
                  child: ComponentEditor.textFieldInStart(
                    "Kullanıcı Adı",
                    const Icon(
                      Icons.person,
                      color: ColorController.soDarkJungleGreen,
                    ),
                  ),
                ),
                ComponentEditor.emptySpace(screenHeight * 0.02),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
                  child: ComponentEditor.textFieldInStart(
                    "Şifre",
                    const Icon(
                      Icons.lock,
                      color: ColorController.soDarkJungleGreen,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Forgot Password butonuna tıklanınca yapılacak işlemler
                        },
                        child: Text(
                          'Şifremi unuttum',
                          style: ComponentEditor.specialText(
                              screenWidth * 0.035, ColorController.soDarkJungleGreen, FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                ComponentEditor.emptySpace(screenHeight * 0.12),
                SizedBox(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.056,
                  child: OutlinedButton(
                    onPressed: () {
                      // Add register logic
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(ColorController.soDarkJungleGreen.withOpacity(0.85)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Kayıt Ol',
                      style: ComponentEditor.specialText(20, Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bir hesabın yok mu?",
                      style: ComponentEditor.specialText(16, Colors.black.withOpacity(0.6)),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: Text(
                          "Kayıt Ol",
                          style: ComponentEditor.specialText(18, ColorController.soDarkJungleGreen, FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

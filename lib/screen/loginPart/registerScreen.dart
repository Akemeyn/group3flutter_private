import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/screen/loginPart/loginScreen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/registerScreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ComponentEditor.emptySpace(screenHeight * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.075),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorController.darkGrayNurse.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        color: ColorController.darkJungleGreen,
                        style: ButtonStyle(),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ComponentEditor.emptySpace(screenHeight * 0.02),
              Text("Kayıt Ol",
                  style: ComponentEditor.specialText(40, ColorController.soDarkJungleGreen, FontWeight.bold)),
              ComponentEditor.emptySpace(screenHeight * 0.005),
              Text("Kendi serüveninin ilk adımını at",
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
                  "E-Posta",
                  const Icon(
                    Icons.mail,
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
              ComponentEditor.emptySpace(screenHeight * 0.02),
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
              Text('Or continue with'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      // Add Facebook login logic
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.android),
                    onPressed: () {
                      // Add Google login logic
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.apple),
                    onPressed: () {
                      // Add Apple login logic
                    },
                  ),
                ],
              ),
              ComponentEditor.emptySpace(screenHeight * 0.22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Halihazırda bir hesabın var mı?",
                    style: ComponentEditor.specialText(16, Colors.black.withOpacity(0.6)),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const LoginScreen());
                      },
                      child: Text(
                        "Giriş Yap",
                        style: ComponentEditor.specialText(18, ColorController.soDarkJungleGreen, FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

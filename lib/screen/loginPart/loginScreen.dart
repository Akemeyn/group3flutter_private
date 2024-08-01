import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/screen/loginPart/registerScreen.dart';
import 'package:nutrijourney/screen/mainPart/mainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double _keyboardVisibleHeight = 0;
  bool passwordVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    _keyboardVisibleHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorController.soDarkJungleGreen,
      body: Stack(
        children: [
          Container(
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
              padding: EdgeInsets.only(
                  top: screenHeight * 0.1 - _keyboardVisibleHeight * 0.26),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ComponentEditor.emptySpace(screenHeight * 0.3),
                      Text("Hoşgeldin",
                          style: ComponentEditor.specialText(
                              40,
                              ColorController.soDarkJungleGreen,
                              FontWeight.bold)),
                      ComponentEditor.emptySpace(screenHeight * 0.005),
                      Text("Serüvenine kaldığın yerden devam et",
                          style: ComponentEditor.specialText(
                              16, ColorController.soDarkJungleGreen)),
                      ComponentEditor.emptySpace(screenHeight * 0.05),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.075),
                        child: ComponentEditor.textFieldInStart(
                            "E-Posta",
                            const Icon(
                              Icons.person,
                              color: ColorController.soDarkJungleGreen,
                            ),
                            false,
                            TextInputType.emailAddress,
                            emailController, (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bilgileri eksiksiz doldurunuz';
                          }
                          return null;
                        }),
                      ),
                      ComponentEditor.emptySpace(screenHeight * 0.02),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.075),
                        child: ComponentEditor.passFieldInStart(
                            "Şifre",
                            const Icon(
                              Icons.lock,
                              color: ColorController.soDarkJungleGreen,
                            ),
                            passwordVisible,
                            TextInputType.visiblePassword,
                            IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            passwordController, (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bilgileri eksiksiz doldurunuz';
                          }
                          return null;
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Forgot Password butonuna tıklanınca yapılacak işlemler
                              },
                              child: Text(
                                'Şifremi unuttum',
                                style: ComponentEditor.specialText(
                                    screenWidth * 0.035,
                                    ColorController.soDarkJungleGreen,
                                    FontWeight.bold),
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              String email = emailController.text;
                              String password = passwordController.text;
                              try {
                                final userResult = await firebaseAuth
                                    .signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (userResult.user?.email == email) {
                                  Get.offAll(() => MainScreen());
                                }
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                ColorController.soDarkJungleGreen
                                    .withOpacity(0.85)),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'Giriş Yap',
                            style:
                                ComponentEditor.specialText(20, Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bir hesabın yok mu?",
                            style: ComponentEditor.specialText(
                                16, Colors.black.withOpacity(0.6)),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => const RegisterScreen());
                              },
                              child: Text(
                                "Kayıt Ol",
                                style: ComponentEditor.specialText(
                                    18,
                                    ColorController.soDarkJungleGreen,
                                    FontWeight.bold),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.075,
            child: Container(
              decoration: BoxDecoration(
                color: ColorController.darkGrayNurse.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: ColorController.darkJungleGreen,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

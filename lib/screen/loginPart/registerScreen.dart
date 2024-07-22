import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrijourney/components/componentEditor.dart';
import 'package:nutrijourney/components/colorController.dart';
import 'package:nutrijourney/screen/loginPart/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

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
          child: Form(
            key: _formKey,
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
                          style: const ButtonStyle(),
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
                    style: ComponentEditor.specialText(40,
                        ColorController.soDarkJungleGreen, FontWeight.bold)),
                ComponentEditor.emptySpace(screenHeight * 0.005),
                Text("Kendi serüveninin ilk adımını at",
                    style: ComponentEditor.specialText(
                        16, ColorController.soDarkJungleGreen)),
                ComponentEditor.emptySpace(screenHeight * 0.05),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
                  child: ComponentEditor.textFieldInStart(
                      "Kullanıcı Adı",
                      const Icon(
                        Icons.person,
                        color: ColorController.soDarkJungleGreen,
                      ),
                      false,
                      TextInputType.text,
                      usernameController, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bilgileri eksiksiz doldurunuz';
                    }
                    return null;
                  }),
                ),
                ComponentEditor.emptySpace(screenHeight * 0.02),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
                  child: ComponentEditor.textFieldInStart(
                      "E-Posta",
                      const Icon(
                        Icons.mail,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
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
                ComponentEditor.emptySpace(screenHeight * 0.02),
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
                          var userResult =
                              await firebaseAuth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          _formKey.currentState!.reset();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            "Başarılı şekilde kayıt olundu...",
                          )));
                          Get.to(const LoginScreen());
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          ColorController.soDarkJungleGreen.withOpacity(0.85)),
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
                const Text('Or continue with'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.facebook),
                      onPressed: () {
                        // Add Facebook login logic
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.android),
                      onPressed: () {
                        // Add Google login logic
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.apple),
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
                      style: ComponentEditor.specialText(
                          16, Colors.black.withOpacity(0.6)),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: Text(
                          "Giriş Yap",
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
    );
  }
}

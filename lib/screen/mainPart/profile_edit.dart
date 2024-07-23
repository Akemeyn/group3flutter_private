import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // TextInputFormatter için gerekli
import 'package:get/get.dart';
import 'package:nutrijourney/screen/mainPart/profile.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Düzenleme'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => const ProfileScreen());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(Icons.email, 'Mail adres', _emailController),
              const SizedBox(height: 16),
              _buildTextField(Icons.person, 'Ad', _firstNameController,
                  inputFormatters: [LettersOnlyTextInputFormatter()]),
              const SizedBox(height: 16),
              _buildTextField(Icons.person, 'Soyad', _lastNameController,
                  inputFormatters: [LettersOnlyTextInputFormatter()]),
              const SizedBox(height: 16),
              _buildTextField(Icons.height, 'Boy', _heightController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
              const SizedBox(height: 16),
              _buildTextField(Icons.monitor_weight, 'Kilo', _weightController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
              const SizedBox(height: 16),
              _buildTextField(Icons.lock, 'Parola', _passwordController,
                  isPassword: true),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _saveProfile();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                ),
                child: const Text(
                  'Kaydet',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      IconData icon, String hintText, TextEditingController controller,
      {bool isPassword = false, List<TextInputFormatter>? inputFormatters}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }

  void _saveProfile() {
    // Veritabanı güncelleme işlemleri
  }
}

//Textfield kısıtlama
class LettersOnlyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final RegExp regex = RegExp(r'^[a-zA-Z]*$');
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

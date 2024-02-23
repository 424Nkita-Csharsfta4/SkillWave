/// Патерн стратегия
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skillwave/course/screens/dashboard_screen.dart';
import 'package:skillwave/screens/auntification/login/interface/registration_strategy.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

///Стратегия для регистрации с изображением
class RegistrationWithImage implements RegistrationStrategy {
  @override
  Future<void> register(BuildContext context, String name, String email,
      String password, File? image) async {
    if (image != null) {
      File imageFile = File(image.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      try {
        final response = await http.post(
          Uri.parse('https://xywozykuxyqkubprtzql.supabase.co'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'apikey':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5d296eWt1eHlxa3VicHJ0enFsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MDY3NzUsImV4cCI6MjAyNDA4Mjc3NX0.pZHIMs4Jzm-h4dPzA8jqqiqZPKhOFKUCRoMljmKM54g',
          },
          body: jsonEncode(<String, String>{
            'name': name,
            'email': email,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          final userData = jsonDecode(response.body);

          final imageResponse = await http.post(
            Uri.parse('https://xywozykuxyqkubprtzql.supabase.co'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'apikey':
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5d296eWt1eHlxa3VicHJ0enFsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MDY3NzUsImV4cCI6MjAyNDA4Mjc3NX0.pZHIMs4Jzm-h4dPzA8jqqiqZPKhOFKUCRoMljmKM54g',
            },
            body: jsonEncode(<String, dynamic>{
              'user_id': userData['id'],
              'image_data': base64Image,
            }),
          );

          if (imageResponse.statusCode == 200) {
            print('Image uploaded successfully');
          } else {
            print('Failed to upload image');
          }

          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        } else {
          print('Failed to register user: ${response.body}');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skillwave/course/screens/dashboard_screen.dart';
import 'package:skillwave/screens/auntification/login/interface/registration_strategy.dart';

class RegistrationStateManager extends ChangeNotifier {
  bool _registrationInProgress = false;
  bool get registrationInProgress => _registrationInProgress;

  void startRegistration(BuildContext context, String name, String email,
      String password, File? image, RegistrationStrategy strategy) async {
    _registrationInProgress = true;
    notifyListeners();

    try {
      await strategy.register(context, name, email, password, image);
    } catch (e) {
      print("Error during registration: $e");
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } finally {
      _registrationInProgress = false;
      notifyListeners();
    }
  }
}

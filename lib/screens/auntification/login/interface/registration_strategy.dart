import 'dart:io';

import 'package:flutter/material.dart';

/// Интерфейс для стратегии регистрации
abstract class RegistrationStrategy {
  Future<void> register(BuildContext context, String name, String email,
      String password, File? image);
}

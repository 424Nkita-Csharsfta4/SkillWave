import 'package:flutter/material.dart';

class ErrorHandler {
  /// Обработка ошибки неограниченной высоты
  static void handleUnboundedHeightError(BoxConstraints constraints) {
    if (constraints.maxHeight.isInfinite) {
      /// Вывод сообщения об ошибке в случае неограниченной высоты
      print("Unbounded height error occurred");
    }
  }

  /// Обработка ошибки неограниченной ширины
  static void handleUnboundedWidthError(BoxConstraints constraints) {
    if (constraints.maxWidth.isInfinite) {
      /// Вывод сообщения об ошибке в случае неограниченной ширины
      print("Unbounded width error occurred");
    }
  }

  /// Обработка общей ошибки с пользовательским сообщением
  static void handleGeneralError(String errorMessage) {
    /// Вывод пользовательского сообщения об общей ошибке
    print("Error occurred: $errorMessage");
  }
}

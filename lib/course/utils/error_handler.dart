import 'package:flutter/material.dart';

class ErrorHandler {
  static void handleUnboundedHeightError(BoxConstraints constraints) {
    if (constraints.maxHeight.isInfinite) {
      print("Unbounded height error occurred");
    }
  }

  static void handleUnboundedWidthError(BoxConstraints constraints) {
    if (constraints.maxWidth.isInfinite) {
      print("Unbounded width error occurred");
    }
  }

  static void handleGeneralError(String errorMessage) {
    print("Error occurred: $errorMessage");
  }
}

import 'package:flutter/material.dart';

class Utils {
  static void showErrorSnackBar(BuildContext context, String message) {
    SnackBar _snackBar = SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }
}

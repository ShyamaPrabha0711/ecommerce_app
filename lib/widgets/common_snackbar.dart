import 'package:flutter/material.dart';

class SnackbarService {
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackbar(
    String message, {
    bool isError = false,
    bool isGeneral = false,
  }) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: isError
            ? Colors.red
            : isGeneral
            ? Colors.grey
            : Colors.green,
      ),
    );
  }
}

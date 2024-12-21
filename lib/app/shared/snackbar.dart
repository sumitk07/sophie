import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/shared/theme.dart';

class CustomSnackbar {
  static info(String message) {
    Get.showSnackbar(
      GetSnackBar(
        // title: "Info",
        messageText: Text(
          message,
          style: medium.copyWith(fontSize: 15, color: Colors.white),
        ),
        icon: const Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        backgroundColor: Colors.blue.withOpacity(0.8),
        barBlur: 50.0,
        margin: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
        borderRadius: 15.0,
        animationDuration: const Duration(milliseconds: 100),
        forwardAnimationCurve: Curves.elasticIn,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static success(String message) {
    Get.showSnackbar(
      GetSnackBar(
        // title: "Info",
        messageText: Text(
          message,
          style: medium.copyWith(fontSize: 15, color: Colors.white),
        ),
        icon: const Icon(
          Icons.check_box_outlined,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        backgroundColor: Colors.green.withOpacity(0.8),
        barBlur: 50.0,
        margin: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
        borderRadius: 15.0,
        animationDuration: const Duration(milliseconds: 100),
        forwardAnimationCurve: Curves.elasticIn,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static error(String message) {
    Get.showSnackbar(
      GetSnackBar(
        // title: "Error",
        messageText: Text(
          message,
          style: medium.copyWith(fontSize: 15, color: Colors.white),
        ),
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
        barBlur: 50.0,
        margin: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
        borderRadius: 15.0,
        animationDuration: const Duration(milliseconds: 100),
        forwardAnimationCurve: Curves.elasticIn,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

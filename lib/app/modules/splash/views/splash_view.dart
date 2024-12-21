import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/shared/theme.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash/bg.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Center(
            child: Container(
          width: 262,
          height: 311,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash/logo.png'),
            ),
          ),
        )),
      ),
    );
  }
}

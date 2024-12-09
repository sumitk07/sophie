import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sophie/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  static OnboardingController to = Get.find();

  PageController pageController = PageController();
  final localStorage = GetStorage();

  RxInt page = 0.obs;

  nextPage() {
    if (page.value != 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      localStorage.write('isFirstTime', false);
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}

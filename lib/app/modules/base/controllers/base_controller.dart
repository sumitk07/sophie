import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  static BaseController to = Get.find();

  late PageController pageController;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void goToPage(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
}

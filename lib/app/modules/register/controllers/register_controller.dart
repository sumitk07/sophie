import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static RegisterController to = Get.find();

  late TabController tabController;
  final List<String> tabs = ["Email Address", "Phone Number"];

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Create Password Screen
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Verify OTP Screen
  TextEditingController otpController = TextEditingController();
  Rxn<String> otpError = Rxn("");
  RxBool isOtpValid = false.obs;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  // Verify OTP Screen
  void otpValidate(String otp) {
    otpError.value = "";
    isOtpValid(otp.length == 6);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

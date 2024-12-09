import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static LoginController to = Get.find();

  late TabController tabController;
  final List<String> tabs = ["Email Address", "Phone Number"];

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // RESET PASSWORD SCREEN
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool rememberMe = false.obs;

  // Verify OTP Screen
  TextEditingController otpController = TextEditingController();
  Rxn<String> otpError = Rxn("");
  RxBool isOtpValid = false.obs;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  void toggleRememberMe() => rememberMe.value = !rememberMe.value;

  void onChangeRememberMe(bool? val) {
    if (val != null) rememberMe.value = val;
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

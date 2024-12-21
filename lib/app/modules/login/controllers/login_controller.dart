import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/data/api/auth_api.dart';
import 'package:sophie/app/modules/auth/controllers/auth_controller.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static LoginController to = Get.find();

  final _authApi = AuthApi();
  final authController = AuthController.to;

  late TabController tabController;
  final List<String> tabs = ["Email Address", "Phone Number"];

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Login states
  RxBool loading = false.obs;

  // RESET PASSWORD SCREEN
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool rememberMe = false.obs;

  // Verify OTP Screen
  TextEditingController otpController = TextEditingController();
  Rxn<String> otpError = Rxn("");
  RxBool isOtpValid = false.obs;

  // Otp timer running
  Timer? otpTimer;
  RxInt otpTimeRemaining = 45.obs;

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

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    otpTimeRemaining.value = 45;
    otpTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (otpTimeRemaining.value == 0) {
          otpTimer!.cancel();
        } else {
          otpTimeRemaining.value--;
        }
      },
    );
  }

  Future<void> login() async {
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;
    loading(true);
    try {
      dynamic response;
      if (tabController.index == 0) {
        response = await _authApi.loginViaEmail(email, password);
      } else if (tabController.index == 1) {
        response = await _authApi.loginViaPhone(phone, password);
      }

      if (response.statusCode == 200) {
        await authController.login(
          response.data["data"]["token"],
          response.data["data"]["userDetail"],
          true,
        );
      }
    } catch (err) {
      log(err.toString());
    } finally {
      loading(false);
    }
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/data/api/auth_api.dart';
import 'package:sophie/app/modules/auth/controllers/auth_controller.dart';
import 'package:sophie/app/routes/app_pages.dart';

class RegisterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static RegisterController to = Get.find();

  final authController = AuthController.to;
  final _authApi = AuthApi();

  late TabController tabController;
  final List<String> tabs = ["Email Address", "Phone Number"];

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Create Password Screen
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

// Register states
  RxBool loading = false.obs;

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

  Future<void> sendOtp() async {
    String phone = phoneController.text;
    String email = emailController.text;
    loading(true);
    try {
      dynamic response;
      if (tabController.index == 0) {
        response = await _authApi.sendRegisterOtpEmail(email);
      } else if (tabController.index == 1) {
        response = await _authApi.sendRegisterOtpPhone(phone, "+91");
      }

      if (response.statusCode == 200) {
        Get.toNamed(Routes.VERIFY_REGISTER_OTP);
        startTimer();
      }
    } catch (err) {
      log(err.toString());
    } finally {
      loading(false);
    }
  }

  Future<void> verifyOtp() async {
    String phone = phoneController.text;
    String email = emailController.text;
    String otp = otpController.text;
    String fullName = fullNameController.text;
    loading(true);
    try {
      dynamic response;
      if (tabController.index == 0) {
        response = await _authApi.verifyRegisterOtpEmail(email, otp);
      } else if (tabController.index == 1) {
        response = await _authApi.verifyRegisterOtpPhone(phone, "+91", otp);
      }

      if (response.statusCode == 200) {
        dynamic registerResponse;

        if (tabController.index == 0) {
          registerResponse =
              await _authApi.registerViaEmailVerify(email, fullName);
        } else if (tabController.index == 1) {
          registerResponse =
              await _authApi.registerViaPhoneVerify(phone, "+91", fullName);
        }

        if (registerResponse.statusCode == 200) {
          await authController.login(
            registerResponse.data["data"]["token"],
            registerResponse.data["data"]["userDetail"],
            false,
          );

          Get.toNamed(Routes.CREATE_PASSWORD);
        }
      }
    } catch (err) {
      log(err.toString());
    } finally {
      loading(false);
    }
  }

  Future<void> updatePassword() async {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    loading(true);
    try {
      final response =
          await _authApi.updateUserPassword(password, confirmPassword);

      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.ADD_PROFILE, arguments: {
          "email": emailController.text,
          "fullName": fullNameController.text
        });
      }
    } catch (err) {
      log(err.toString());
    } finally {
      loading(false);
    }
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value == '') {
      return "Required";
    }
    if (value != passwordController.text) {
      return "Passwords must be same";
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sophie/app/modules/register/controllers/register_controller.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

class VerifyRegisterOtpView extends GetView<RegisterController> {
  const VerifyRegisterOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AuthHeader(
                title: "Enter Verification Code",
                subTitle:
                    "Code has been sent to ${controller.tabController.index == 0 ? controller.emailController.text : controller.phoneController.text}",
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(
                      () => Pinput(
                        length: 4,
                        autofocus: true,
                        defaultPinTheme: PinTheme(
                          width: 90,
                          height: 90,
                          textStyle: medium.copyWith(fontSize: 24),
                          decoration: BoxDecoration(
                            color: Color(0xFFE2E8F0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 90,
                          height: 90,
                          textStyle:
                              medium.copyWith(fontSize: 24, color: white),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: controller.otpController,
                        onChanged: controller.otpValidate,
                        forceErrorState: controller.otpError.value != "",
                        errorText: controller.otpError.value,
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Didn't get OTP code?",
                              style: regular.copyWith(fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () => Get.toNamed(Routes.REGISTER),
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0)),
                              child: Text(
                                "Resend",
                                style: regular.copyWith(
                                    fontSize: 16, color: primary),
                              ),
                            )
                          ],
                        ),
                        Obx(() => Text(
                              "00:${controller.otpTimeRemaining.value.toString().padLeft(2, '0')}",
                              style: regular.copyWith(
                                  fontSize: 16, color: primary),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Obx(() => CustomButton(
                      title: "Verify OTP",
                      onPressed: controller.verifyOtp,
                      isLoading: controller.loading.value,
                      isDisabled: controller.loading.value,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

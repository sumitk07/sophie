import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sophie/app/modules/login/controllers/login_controller.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/shared/spacing.dart';
import 'package:sophie/shared/theme.dart';

class VerifyOtpView extends GetView<LoginController> {
  const VerifyOtpView({super.key});

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
                subTitle: "Code has been sent to +6256956695",
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
                        Text(
                          "01:59",
                          style: regular.copyWith(fontSize: 16, color: primary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: CustomButton(
                  title: "Verify OTP",
                  onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

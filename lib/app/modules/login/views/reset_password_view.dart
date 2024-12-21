import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/modules/login/controllers/login_controller.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/widgets/custom_textfield.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

class ResetPasswordView extends GetView<LoginController> {
  const ResetPasswordView({super.key});

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
                title: "Reset Password",
                subTitle: "Set up your password",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomTextField(
                      label: "Password",
                      placeholder: "Enter Password",
                      controller: controller.passwordController,
                      icon: Icons.lock,
                    ),
                    verticalSpace(10),
                    CustomTextField(
                      label: "Confirm Password",
                      placeholder: "Enter Password",
                      controller: controller.confirmPasswordController,
                      icon: Icons.lock,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    CustomButton(
                      title: "Confirm Password",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

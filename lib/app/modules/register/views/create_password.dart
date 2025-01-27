import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/modules/register/controllers/register_controller.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/widgets/custom_textfield.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

class CreatePasswordView extends GetView<RegisterController> {
  const CreatePasswordView({super.key});

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
                title: "Create Password",
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
                      // validator: controller.passwordValidator,
                    ),
                    verticalSpace(10),
                    CustomTextField(
                      label: "Confirm Password",
                      placeholder: "Enter Password",
                      controller: controller.confirmPasswordController,
                      icon: Icons.lock,
                      validator: controller.confirmPasswordValidator,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    Obx(
                      () => CustomButton(
                        title: "Confirm Password",
                        onPressed: controller.updatePassword,
                        isDisabled: controller.loading.value,
                        isLoading: controller.loading.value,
                      ),
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

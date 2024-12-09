import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/modules/login/controllers/login_controller.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/widgets/custom_textfield.dart';
import 'package:sophie/shared/spacing.dart';
import 'package:sophie/shared/theme.dart';

class ForgotPasswordView extends GetView<LoginController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              AuthHeader(
                title: "Forgot Password",
                subTitle: "We'll send you reset instructions.",
              ),
              verticalSpace(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(7),
                  child: TabBar.secondary(
                    controller: controller.tabController,
                    indicator: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    dividerColor: transparent,
                    labelColor: primary,
                    tabs: controller.tabs
                        .map(
                          (e) => Tab(
                            child: Text(
                              e,
                              style: medium.copyWith(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              verticalSpace(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 120,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      CustomTextField(
                        label: "Email",
                        placeholder: "Enter Email Address",
                        controller: controller.emailController,
                        icon: Icons.email,
                      ),
                      CustomTextField(
                        label: "Phone Number",
                        placeholder: "Enter Phone Number",
                        controller: controller.phoneController,
                        icon: Icons.phone,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  title: "Reset Password",
                  onPressed: () => Get.toNamed(Routes.VERIFY_OTP),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/widgets/custom_textfield.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
                title: "Welcome 👋",
                subTitle: "Let's Get You Started with AI Calling",
              ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
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
                    CustomTextField(
                      label: "Password",
                      placeholder: "Enter Password",
                      controller: controller.passwordController,
                      icon: Icons.lock,
                    ),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: controller.toggleRememberMe,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    value: controller.rememberMe.value,
                                    onChanged: controller.onChangeRememberMe,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    side: BorderSide(
                                      color: Colors.grey[400]!,
                                      width: 1.5,
                                    ),
                                    activeColor: primary,
                                  ),
                                ),
                                horizontalSpace(5),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: textBlack,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                          style:
                              TextButton.styleFrom(padding: EdgeInsets.all(0)),
                          child: Text(
                            "Forgot Password?",
                            style:
                                regular.copyWith(fontSize: 16, color: primary),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Obx(() => CustomButton(
                          title: "Sign In",
                          onPressed: controller.login,
                          isLoading: controller.loading.value,
                          isDisabled: controller.loading.value,
                        )),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an account?",
                          style: regular.copyWith(fontSize: 16),
                        ),
                        horizontalSpace(5),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.REGISTER),
                          style:
                              TextButton.styleFrom(padding: EdgeInsets.all(0)),
                          child: Text(
                            "Register Now",
                            style:
                                regular.copyWith(fontSize: 16, color: primary),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox.shrink(),
              SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

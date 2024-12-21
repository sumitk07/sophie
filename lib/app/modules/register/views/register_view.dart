import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/widgets/custom_textfield.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
                title: "Create New Account",
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
                    CustomTextField(
                      label: "Full Name",
                      placeholder: "Enter Your Full Name",
                      controller: controller.fullNameController,
                      icon: Icons.lock,
                    ),
                    verticalSpace(10),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Obx(() => CustomButton(
                          title: "Register",
                          onPressed: controller.sendOtp,
                          isLoading: controller.loading.value,
                          isDisabled: controller.loading.value,
                        )),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: regular.copyWith(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: Get.back,
                          style:
                              TextButton.styleFrom(padding: EdgeInsets.all(0)),
                          child: Text(
                            "Login",
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

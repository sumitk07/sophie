import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/modules/auth/controllers/auth_controller.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';
import 'package:sophie/app/widgets/custom_appbar.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/widgets/custom_textfield.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final _authController = AuthController.to;
    return Scaffold(
      appBar: CustomAppBar(title: "Profile"),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: Get.height,
          child: ListView(
            children: [
              verticalSpace(20),
              Column(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Obx(() => ClipOval(
                          child: controller.profileImage.value != null
                              ? Image.file(
                                  File(controller.profileImage.value!.path),
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: Color(0xFFD9D9D9),
                                  padding: EdgeInsets.all(25),
                                  child: Image.asset(
                                    'assets/images/add_profile/avatar.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        )),
                  ),
                  TextButton(
                    onPressed: controller.imagePickerSourceDialog,
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                    child: Text(
                      "+ Add Profile View",
                      style: regular.copyWith(fontSize: 16, color: primary),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  CustomTextField(
                    label: "Email",
                    placeholder: "",
                    controller: controller.emailController,
                    icon: Icons.email,
                  ),
                  verticalSpace(10),
                  CustomTextField(
                    label: "Phone Number",
                    placeholder: "",
                    controller: controller.phoneNoController,
                    icon: Icons.phone,
                  ),
                  CustomTextField(
                    disabled: true,
                    onPressed: () {
                      controller.selectDob(context);
                    },
                    controller: controller.dobController,
                    label: "DOB",
                    placeholder: "Select Date",
                    icon: Icons.date_range_rounded,
                  ),
                  verticalSpace(10),
                  CustomTextField(
                    label: "Password",
                    placeholder: "",
                    controller: controller.passwordController,
                    icon: Icons.password,
                  ),
                ],
              ),
              verticalSpace(20),
              CustomButton(
                onPressed: controller.updateProfile,
                title: "Save",
              ),
              verticalSpace(20),
              CustomButton(
                onPressed: _authController.logOut,
                title: "Logout",
              ),
              verticalSpace(150)
            ],
          ),
        ),
      ),
    );
  }
}

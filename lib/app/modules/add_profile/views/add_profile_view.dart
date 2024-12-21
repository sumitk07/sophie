import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/widgets/custom_textfield.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

import '../controllers/add_profile_controller.dart';

class AddProfileView extends GetView<AddProfileController> {
  const AddProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    label: "Full Name",
                    placeholder: "Enter Your Full Name",
                    controller: controller.fullNameController,
                    icon: Icons.person,
                  ),
                  verticalSpace(10),
                  CustomTextField(
                    disabled: true,
                    onPressed: () {
                      controller.selectDob(context);
                    },
                    controller: controller.dobController,
                    label: "Date of Birth",
                    placeholder: "Select Date",
                    icon: Icons.date_range_rounded,
                  ),
                  verticalSpace(10),
                  CustomTextField(
                    label: "Phone Number",
                    placeholder: "Enter Phone Number",
                    controller: controller.phoneNoController,
                    icon: Icons.phone,
                  ),
                  verticalSpace(10),
                  CustomTextField(
                    label: "Email",
                    placeholder: "Enter Email Address",
                    controller: controller.emailController,
                    icon: Icons.email,
                  ),
                  verticalSpace(30)
                ],
              ),
              Obx(() => CustomButton(
                    onPressed: controller.updateProfile,
                    title: "Add Profile",
                    isLoading: controller.loading.value,
                    isDisabled: controller.loading.value,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

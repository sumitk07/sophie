import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/modules/sub_profile/controllers/sub_profiles_controller.dart';
import 'package:sophie/app/widgets/custom_appbar.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/widgets/custom_dropdown.dart';
import 'package:sophie/app/widgets/custom_textfield.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

class AddSubProfileView extends GetView<SubProfilesController> {
  const AddSubProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Sub Profile",
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          height: Get.height * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                    onPressed: () => controller.selectDob(context),
                    controller: controller.dobController,
                    label: "Date of Birth",
                    placeholder: "Select Date",
                    icon: Icons.date_range_rounded,
                  ),
                  verticalSpace(10),
                  CustomDropdown(
                    controller: controller.genderController,
                    label: "Gender",
                    options: ["Male", "Female", "Other"],
                    icon: Icons.male_rounded,
                  ),
                ],
              ),
              Obx(() => CustomButton(
                    title: "Add Sub-Profile",
                    onPressed: controller.addSubprofile,
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

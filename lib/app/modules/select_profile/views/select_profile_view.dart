import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/modules/auth/controllers/auth_controller.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/shared/theme.dart';

import '../controllers/select_profile_controller.dart';

class SelectProfileView extends GetView<SelectProfileController> {
  const SelectProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(title: "Select Profile", isBack: false),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: Get.height * 0.6,
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.loading.value)
                        CircularProgressIndicator(color: primary)
                      else if (controller.subUsers.isEmpty)
                        Image.asset("assets/images/select_profile/img.png")
                      else
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: controller.subUsers
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: InkWell(
                                        onTap: () =>
                                            authController.setSubUser(e),
                                        child: Column(
                                          children: [
                                            ClipOval(
                                              child: e.profileImage.length > 100
                                                  ? Image.network(
                                                      e.profileImage,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Container(
                                                      color: Color(0xFFD9D9D9),
                                                      padding:
                                                          EdgeInsets.all(25),
                                                      child: Image.asset(
                                                        'assets/images/add_profile/avatar.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                            ),
                                            verticalSpace(16),
                                            Text(
                                              e.fullName,
                                              style: semibold.copyWith(
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      verticalSpace(50),
                      CustomButton(
                        title: "Add Sub-Profile",
                        onPressed: () => Get.toNamed(Routes.ADD_SUB_PROFILE),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

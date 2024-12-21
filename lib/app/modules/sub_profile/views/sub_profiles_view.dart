import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/modules/sub_profile/controllers/sub_profiles_controller.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_appbar.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/shared/theme.dart';

class SubProfileView extends GetView<SubProfilesController> {
  const SubProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Sub Profiles',
        back: true,
      ),
      body: Column(
        children: [
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
                                  (e) => Container(
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 200,
                                    width: 170,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        verticalSpace(10),
                                        ClipOval(
                                          child: e.profileImage.length > 100
                                              ? Image.network(
                                                  e.profileImage,
                                                  fit: BoxFit.cover,
                                                )
                                              : Container(
                                                  color: Color(0xFFD9D9D9),
                                                  padding: EdgeInsets.all(20),
                                                  child: Image.asset(
                                                    'assets/images/add_profile/avatar.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                        Text(
                                          e.fullName,
                                          style:
                                              semibold.copyWith(fontSize: 20),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 50,
                                          ),
                                          child: Divider(
                                            color: primary,
                                            height: 7,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    CustomButton(
                      title: "Add Sub Profile",
                      onPressed: () => Get.toNamed(Routes.ADD_SUB_PROFILE),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

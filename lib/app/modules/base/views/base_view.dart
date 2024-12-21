import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/modules/home/views/home_view.dart';
import 'package:sophie/app/modules/profile/views/profile_view.dart';
import 'package:sophie/app/modules/schedule/views/schedule_view.dart';
import 'package:sophie/app/modules/sub_profile/views/sub_profiles_view.dart';
import 'package:sophie/app/widgets/custom_bottom_navbar.dart';

import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeView(),
          ScheduleView(),
          SubProfileView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(controller: controller),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}

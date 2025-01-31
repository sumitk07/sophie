import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/modules/login_social/views/login_social_view.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageView(
          controller: controller.pageController,
          onPageChanged: (value) => controller.page.value = value,
          physics: controller.page.value == 3
              ? NeverScrollableScrollPhysics()
              : AlwaysScrollableScrollPhysics(),
          children: [
            OnboardingWidget(
              image: "bg1.png",
              title: "Welcome to Sophie!",
              subTitle:
                  "Discover the future of conversations with AI. Schedule calls, get insights, and engage with intelligent dialogue.",
            ),
            OnboardingWidget(
              image: "bg2.png",
              title: "Welcome to Sophie!",
              subTitle:
                  "Discover the future of conversations with AI. Schedule calls, get insights, and engage with intelligent dialogue.",
            ),
            OnboardingWidget(
              image: "bg3.png",
              title: "Welcome to Sophie!",
              subTitle:
                  "Discover the future of conversations with AI. Schedule calls, get insights, and engage with intelligent dialogue.",
            ),
            LoginSocialView()
          ],
        ),
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: backgroundColor,
      child: Column(
        children: [
          Image.asset("assets/images/onboarding/$image"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: semibold.copyWith(fontSize: 28, color: primary),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(30),
                  Text(
                    subTitle,
                    style: regular.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(30),
                  GetX<OnboardingController>(
                    init: OnboardingController.to,
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3, // Number of pages
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: controller.page.value == index ? 25 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: controller.page.value == index
                                  ? primary
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/shared/spacing.dart';
import 'package:sophie/shared/theme.dart';

import '../controllers/login_social_controller.dart';

class LoginSocialView extends GetView<LoginSocialController> {
  const LoginSocialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        height: Get.height,
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: Get.height * 0.12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset("assets/images/login/logo.png"),
                  verticalSpace(20),
                  Text(
                    "Let's Get You Started",
                    style: semibold.copyWith(fontSize: 28),
                  )
                ],
              ),
              Column(
                children: [
                  SocialLoginButton(
                    image: 'google.png',
                    provider: "Google",
                  ),
                  verticalSpace(20),
                  SocialLoginButton(
                    image: 'facebook.png',
                    provider: "Facebook",
                  ),
                  if (Platform.isIOS)
                    Column(
                      children: [
                        verticalSpace(20),
                        SocialLoginButton(
                          image: 'apple.png',
                          provider: "Apple",
                        ),
                      ],
                    ),
                ],
              ),
              Column(
                children: [
                  CustomButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    title: "Sign In Using Email/Phone No",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New to AI Calling?",
                        style: regular.copyWith(fontSize: 16),
                      ),
                      horizontalSpace(5),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.REGISTER),
                        style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                        child: Text(
                          "Register Now",
                          style: regular.copyWith(fontSize: 16, color: primary),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ]),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String image;
  final String provider;

  const SocialLoginButton({
    super.key,
    required this.image,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: white,
        side: BorderSide(
          color: Color(0xFFDADADA),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/login/$image",
          ),
          horizontalSpace(30),
          Text(
            "Sign In Using $provider Account",
            style: regular.copyWith(
              fontSize: 16,
              color: textBlack,
            ),
          )
        ],
      ),
    );
  }
}

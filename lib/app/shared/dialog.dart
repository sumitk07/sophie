import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

class DialogAction {
  final void Function()? onPressed;
  final String label;

  DialogAction({required this.label, this.onPressed});
}

void dialog(
    {required String title,
    required String image,
    required Function() primaryAction,
    required String primaryTitle}) {
  Platform.isIOS
      ? Get.dialog(
          CupertinoAlertDialog(
            content: SizedBox(
              width: Get.width * 0.9,
              height: Get.height * 0.3,
              child: Column(children: [
                Image.asset("assets/images/subscription/popup.png"),
                Text(title),
                CustomButton(
                  width: 50,
                  onPressed: Get.back,
                )
              ]),
            ),
          ),
        )
      : Get.dialog(
          AlertDialog(
            content: SizedBox(
              width: Get.width * 0.9,
              height: Get.height * 0.45,
              child: Column(
                children: [
                  verticalSpace(20),
                  Image.asset(image),
                  verticalSpace(20),
                  Text(
                    title,
                    style: semibold.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(20),
                  CustomButton(
                    width: 150,
                    onPressed: primaryAction,
                    title: primaryTitle,
                  )
                ],
              ),
            ),
            backgroundColor: secondary,
          ),
        );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/shared/theme.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool? isBack;

  const AuthHeader(
      {super.key, required this.title, this.subTitle, this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary,
      height: Get.height * 0.3,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBack != false)
            ClipOval(
              child: Material(
                color: white,
                child: InkWell(
                  onTap: Get.back,
                  child: SizedBox(
                    width: 46,
                    height: 46,
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: primary,
                    ),
                  ),
                ),
              ),
            )
          else
            SizedBox.shrink(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: medium.copyWith(fontSize: 28, color: white),
              ),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: regular.copyWith(fontSize: 16, color: white),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

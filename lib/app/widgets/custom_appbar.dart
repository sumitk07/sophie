import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/shared/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool back;
  final String title;

  const CustomAppBar({super.key, this.back = false, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: white,
        leadingWidth: 80,
        centerTitle: true,
        leading: back
            ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(40),
                        onTap: Get.back,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: primary,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        title: Text(
          title,
          style: regular.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

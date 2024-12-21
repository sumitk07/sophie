import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophie/app/modules/base/controllers/base_controller.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

class CustomBottomNavbar extends StatelessWidget {
  final BaseController controller;

  const CustomBottomNavbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 1),
      children: [
        Container(
          height: 70,
          color: white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomNavItem(0, Icons.home, 'Home'),
                  _buildBottomNavItem(
                      1, Icons.calendar_today, 'Schedule Calls'),
                  horizontalSpace(40),
                  _buildBottomNavItem(2, Icons.person_outline, 'Sub-Profiles'),
                  _buildBottomNavItem(3, Icons.account_circle, 'Profile'),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.add,
                color: white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    final isSelected = controller.currentPage.value == index;
    return InkWell(
      onTap: () => controller.goToPage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.green[400] : Colors.grey,
          ),
          verticalSpace(3),
          Text(
            label,
            style: regular.copyWith(
              fontSize: 12,
              color: isSelected ? Colors.green[400] : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/widgets/auth_header.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

import '../controllers/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => controller.subscriptionPopup());

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(title: "Select Your Plan to Unlock Premium Features"),
              verticalSpace(20),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select a plan',
                        style: regular.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      verticalSpace(16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SubscriptionCard(
                              isSelected: true,
                              isPopular: true,
                              title: 'Monthly',
                              price: '\$12.99',
                            ),
                            horizontalSpace(12),
                            SubscriptionCard(
                              isSelected: false,
                              isPopular: false,
                              title: '1 week',
                              price: '\$12.99',
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(24),
                      PremiumFeatureCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            width: Get.width,
            child: Container(
              decoration: BoxDecoration(
                color: white,
                border: Border(
                  top: BorderSide(color: Color(0xFFDADADA)),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'By tapping Continue, you will be charged, your subscription will auto-renew for the same price and package length until you cancel via App Store settings, and you agree to our Terms.',
                    style: regular.copyWith(fontSize: 12),
                  ),
                  verticalSpace(20),
                  CustomButton(
                    title: 'Continue - \$12.99 total',
                    onPressed: () => Get.offAllNamed(Routes.SELECT_PROFILE),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PremiumFeatureCard extends StatelessWidget {
  const PremiumFeatureCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 25,
              bottom: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFBFBFBF),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
                children: [
              'Unlimited Calls',
              'Schedule Calls',
              'Add Reminders',
              'Premium AI Assistant',
            ].map((feature) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: primary,
                    ),
                    horizontalSpace(10),
                    Text(
                      feature,
                      style: semibold.copyWith(fontSize: 18),
                    )
                  ],
                ),
              );
            }).toList()),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Color(0xFFBFBFBF)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Premium Features',
              style: regular.copyWith(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final bool isSelected;
  final bool isPopular;
  final String title;
  final String price;

  const SubscriptionCard({
    super.key,
    required this.isSelected,
    required this.isPopular,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFF00BFA5) : Colors.grey[300]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isPopular)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BFA5).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Popular',
                    style: TextStyle(
                      color: Color(0xFF00BFA5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              if (isSelected)
                const Icon(
                  Icons.check,
                  color: Color(0xFF00BFA5),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: TextStyle(
              fontSize: 18,
              color: const Color(0xFF00BFA5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_application/constant/app_colors.dart';
import 'package:food_delivery_application/modules/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final onboardingController = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
        children: [
          const SizedBox(height: 30),
          // Image part...
          SvgPicture.asset(
            onboardingController.onboardingItemsList[onboardingController.index.value].image,
          ),
          const SizedBox(height: 30),

          // Title  part and sub-Title......
          Column(
            children: [
              Text(
                onboardingController.onboardingItemsList[onboardingController.index.value].title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                onboardingController.onboardingItemsList[onboardingController.index.value].subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
           const SizedBox(height: 60),

          // Button part...
          GestureDetector(
            onTap: () {
              int tempIndex = onboardingController.index.value;

              if (tempIndex == onboardingController.onboardingItemsList.length - 1) {
                // Go to next screen....
              } else {
                onboardingController.index(tempIndex + 1);
              }
            },
            child: Container(
              height: 57,
              width: 157,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightGreenColor,
              ),
              child: const Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
             ),
           ),
         ],
       ),
      ),
    );
  }
}

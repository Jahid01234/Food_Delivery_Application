import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_application/common/buttons/app_primary_button.dart';
import 'package:food_delivery_application/modules/auth_module/views/login_screen.dart';
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
           AppPrimaryButton(
            title: "Next",
            onTap: () {
              int tempIndex = onboardingController.index.value;

              if (tempIndex == onboardingController.onboardingItemsList.length - 1) {
                // Go to next screen....
                Get.to(const LoginScreen());
              } else {
                onboardingController.index(tempIndex + 1);
              }
            },
          ),
         ],
       ),
      ),
    );
  }
}

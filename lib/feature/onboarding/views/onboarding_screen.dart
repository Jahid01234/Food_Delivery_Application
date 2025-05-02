import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_application/core/global_widgets/app_primary_button.dart';
import 'package:food_delivery_application/core/route/routes.dart';
import 'package:food_delivery_application/core/style/global_text_style.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.find<OnboardingController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: controller.skip,
                child: Text(
                  "Skip",
                  style: globalTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) => controller.currentIndex.value = index,
                itemCount: controller.onboardingPage.length,
                itemBuilder: (context, index) {
                  final item = controller.onboardingPage[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(item.image, height: 272),
                      const SizedBox(height: 48),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        item.subTitle,
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            // Dot Indicators
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingPage.length,
                      (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentIndex.value == index ? 25 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                      controller.currentIndex.value == index
                          ?  Colors.cyan.shade800
                          : const Color(0xffADA9A9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),
            // Next Button
            Obx(() {
              bool isLast =
                  controller.currentIndex.value ==
                      controller.onboardingPage.length - 1;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppPrimaryButton(
                  width: 200,
                  title: isLast ? "Let's get started" : "Next",
                  onTap: () {
                    if (isLast) {
                      Get.offNamed(AppRoutes.welcome);
                    } else {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:food_delivery_application/core/route/routes.dart';
import 'package:food_delivery_application/feature/onboarding/models/onboarding_model.dart';
import 'package:get/get.dart';


class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;

  var onboardingPage = <OnboardingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOnboardingPage();
  }


  void loadOnboardingPage(){
    onboardingPage.addAll(onboardingItemsListData);
  }

  void nextPage() {
    if (currentIndex.value < onboardingPage.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      finishOnboarding();
    }
  }

  void skip() {
    finishOnboarding();
  }

  void finishOnboarding() {
    Get.offNamed(AppRoutes.welcome);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
import 'package:food_delivery_application/constant/app_imges.dart';
import 'package:food_delivery_application/models/onboarding_model.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController{

  RxInt index = 0.obs;

  List<OnboardingModel> onboardingItemsList = [
    OnboardingModel(
        title: "Find your  Comfort\n Food here",
        subTitle: "Here You Can find a chef or dish for every\n taste and color. Enjoy!",
        image: AppImages.onboardingImg1,
    ),
    OnboardingModel(
      title: "Food Ninja is Where Your\n Comfort Food Lives",
      subTitle: "Enjoy a fast and smooth food delivery at\n your doorstep.",
      image: AppImages.onboardingImg2,
    ),
  ];

}
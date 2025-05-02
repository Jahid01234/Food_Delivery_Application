
import 'package:food_delivery_application/core/const/imges_path.dart';

class OnboardingModel{
  final String title;
  final String subTitle;
  final String image;

  OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
 });

}

List<OnboardingModel> onboardingItemsListData = [
    OnboardingModel(
        title: "Find your  Comfort\n Food here",
        subTitle: "Here You Can find a chef or dish for every\n taste and color. Enjoy!",
        image: ImagePath.onboardingImg1,
    ),
    OnboardingModel(
      title: "Food Ninja is Where Your\n Comfort Food Lives",
      subTitle: "Enjoy a fast and smooth food delivery at\n your doorstep.",
      image: ImagePath.onboardingImg2,
    ),
  ];
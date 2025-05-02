import 'package:food_delivery_application/core/route/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  // Go to onboarding screen ...
  void redirectToNextScreen()async{
    await Future.delayed( const Duration(seconds: 2));
    Get.toNamed(AppRoutes.splash);
  }

}
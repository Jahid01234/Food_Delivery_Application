import 'package:food_delivery_application/feature/onboarding/controller/onboarding_controller.dart';
import 'package:food_delivery_application/feature/auth/login/controller/login_controller.dart';
import 'package:food_delivery_application/feature/auth/register/controller/signup_controller.dart';
import 'package:food_delivery_application/feature/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(()=>SplashController());
    Get.put(OnboardingController());
    Get.put(LoginController());
    Get.put(SignupController());
  }

}
import 'package:food_delivery_application/modules/auth_module/controller/login_controller.dart';
import 'package:food_delivery_application/modules/auth_module/controller/signup_controller.dart';
import 'package:food_delivery_application/modules/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{

  @override
  void dependencies() {
    Get.put(OnboardingController());
    Get.put(LoginController());
    Get.put(SignupController());
  }

}
import 'package:food_delivery_application/feature/auth/login/view/login_screen.dart';
import 'package:food_delivery_application/feature/auth/register/view/signup_screen.dart';
import 'package:food_delivery_application/feature/onboarding/views/onboarding_screen.dart';
import 'package:food_delivery_application/feature/splash/view/splash_screen.dart';
import 'package:food_delivery_application/feature/welcome/view/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {

  // Get routes name here.......
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';

  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';

  // Get routes here.......
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.leftToRight,
    ),

     GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: register, page: () => SignUpScreen()),
    // GetPage(name: forgetPassword, page: () => ForgetPasswordScreen()),
    //


  ];
}
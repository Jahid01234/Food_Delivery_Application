import 'package:flutter/material.dart';
import 'package:food_delivery_application/constant/app_imges.dart';
import 'package:food_delivery_application/modules/onboarding/views/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    redirectToNextScreen();
  }

  // Go to onboarding screen ...
  redirectToNextScreen()async{
    await Future.delayed( const Duration(seconds: 2));
    Get.to(const OnboardingScreen());
  }
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Image....
          Container(
            height: 370,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black,
                ],
              ),
            ),
            child: Image.asset(
              AppImages.backgroundImage,
              fit: BoxFit.contain,
            ),
          ),

          // App Logo....
          Positioned(
            top: 340,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.appLogo,
              fit: BoxFit.contain,
              height: 203,
              width: 188,
            ),
          ),
        ],
      ),
    );
  }
}

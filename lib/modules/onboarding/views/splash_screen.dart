import 'package:flutter/material.dart';
import 'package:food_delivery_application/constant/app_colors.dart';
import 'package:food_delivery_application/constant/app_imges.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
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
              fit: BoxFit.cover,
            ),
          ),

          // App Logo....
          Positioned(
            top: 350,
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

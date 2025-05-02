import 'package:flutter/material.dart';
import 'package:food_delivery_application/core/const/app_sizes.dart';
import 'package:food_delivery_application/core/const/imges_path.dart';
import 'package:food_delivery_application/feature/splash/controller/splash_controller.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Image....
          Container(
            height: getHeight(370),
            width: double.infinity,
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
              ImagePath.backgroundImage,
              fit: BoxFit.contain,
            ),
          ),

          // App Logo....
          Positioned(
            top: getHeight(340),
            left: 0,
            right: 0,
            child: Image.asset(
              ImagePath.appLogo,
              fit: BoxFit.contain,
              height: getHeight(203),
              width: getWidth(188),
            ),
          ),
        ],
      ),
    );
  }
}

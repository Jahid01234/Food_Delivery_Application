import 'package:flutter/material.dart';
import 'package:food_delivery_application/bindings/controller_binder.dart';
import 'package:food_delivery_application/constant/app_colors.dart';
import 'package:food_delivery_application/modules/onboarding/views/splash_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Ninja',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.blackColor,
      ),
      home: const SplashScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:food_delivery_application/core/bindings/controller_binder.dart';
import 'package:food_delivery_application/core/const/app_colors.dart';
import 'package:get/get.dart';
import 'core/const/app_sizes.dart';
import 'core/route/routes.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GetMaterialApp(
      title: 'Food Ninja',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.blackColor,
      ),
    );
  }
}
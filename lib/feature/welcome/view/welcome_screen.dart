import 'package:flutter/material.dart';
import 'package:food_delivery_application/core/const/app_sizes.dart';
import 'package:food_delivery_application/core/global_widgets/app_primary_button.dart';
import 'package:food_delivery_application/core/route/routes.dart';
import 'package:food_delivery_application/core/style/global_text_style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/const/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: getHeight(160)),
          Text(
            "FOOD NINJA",
            style: GoogleFonts.genos(
              fontSize: 45,
              fontWeight: FontWeight.w700,
              color: AppColors.greenColor
            ),
          ),
          SizedBox(height:getHeight(40)),
          Text(
            "DELIVERING DELICIOUSNESS TO YOUR DOORSTEP!",
            style: globalTextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height:getHeight(160)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade900,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: getHeight(10)),
                  SizedBox(
                    height: 2,
                    width: 48,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999),
                        color: Color(0xffFFFFFF).withValues(alpha: .6),
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(50)),
                  Text(
                    "Welcome to Food Ninja!",
                    style: globalTextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getHeight(16)),
                  Text(
                    "Order your favorite meals from top restaurants\nand get them delivered fast & fresh.",
                    style: GoogleFonts.openSans(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getHeight(80)),
                  AppPrimaryButton(
                    title: "Login",
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                  ),
                  SizedBox(height: getHeight(30)),
                  AppPrimaryButton(
                    title: "Sign up",
                    onTap: () {
                      Get.toNamed(AppRoutes.register);
                    },
                  ),

                  SizedBox(height: getHeight(30)),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
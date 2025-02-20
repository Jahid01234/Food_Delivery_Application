import 'package:flutter/material.dart';
import 'package:food_delivery_application/common/buttons/app_primary_button.dart';
import 'package:food_delivery_application/constant/app_colors.dart';
import 'package:food_delivery_application/constant/app_imges.dart';
import 'package:food_delivery_application/modules/auth_module/controller/login_controller.dart';
import 'package:food_delivery_application/modules/auth_module/widgets/social_media_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
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

            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // App Logo....
                  Image.asset(
                    AppImages.appLogo,
                    fit: BoxFit.contain,
                    height: 203,
                    width: 188,
                  ),
                  const SizedBox(height: 40),
                  // Or Continue With text part....
                  const Text(
                    "Login Up For Free",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),
                  // Text Field....
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              hintText: "Email",
                              filled: true,
                              fillColor: AppColors.textFieldColor,
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            obscureText: loginController.obscureText.value,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                hintText: "Password",
                                filled: true,
                                fillColor: AppColors.textFieldColor,
                                contentPadding: const EdgeInsets.all(18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    loginController.obscureText.value =
                                        !loginController.obscureText.value;
                                  },
                                  icon: Icon(
                                    loginController.obscureText.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Or Continue With text part....
                  const Text(
                    "Or Continue With",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialMediaButton(
                          label: "Facebook",
                          image: AppImages.facebookImg,
                        ),
                        SocialMediaButton(
                          label: "Google",
                          image: AppImages.googleImg,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Forgot Your Password? text part....
                  const Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                        color: AppColors.lightGreenColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 70),
                  // Button part...
                  AppPrimaryButton(
                    title: "Log in",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

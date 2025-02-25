import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/common/buttons/app_primary_button.dart';
import 'package:food_delivery_application/common/text_fields/custom_text_field.dart';
import 'package:food_delivery_application/constant/app_colors.dart';
import 'package:food_delivery_application/constant/app_imges.dart';
import 'package:food_delivery_application/modules/auth_module/controller/login_controller.dart';
import 'package:food_delivery_application/modules/auth_module/views/signup_screen.dart';
import 'package:food_delivery_application/modules/auth_module/widgets/social_media_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final loginController = Get.find<LoginController>();


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
                      "Login For Free",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    const SizedBox(height: 20),
                    // Text Field....
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Email",
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            obscureText: loginController.obscureText.value,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "Password",
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Forgot Your Password? text part....
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget Your Password?",
                          style: TextStyle(
                            color: AppColors.lightGreenColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Or Continue With text part....
                    const Text(
                      "Or Continue With",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                      ),
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

                    const SizedBox(height: 40),
                    // Button part...
                    AppPrimaryButton(
                      title: "Log in",
                      onTap: () {},
                    ),

                    // Don't have an account? signUp....
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: "SignUp",
                            style: const TextStyle(
                                fontSize: 15,
                                color: AppColors.lightGreenColor,
                                fontWeight: FontWeight.w600
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                 Get.to(const SignUpScreen());
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

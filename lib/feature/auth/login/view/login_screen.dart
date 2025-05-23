import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/core/global_widgets/app_primary_button.dart';
import 'package:food_delivery_application/core/global_widgets/custom_text_field.dart';
import 'package:food_delivery_application/core/const/app_colors.dart';
import 'package:food_delivery_application/core/const/imges_path.dart';
import 'package:food_delivery_application/feature/auth/login/controller/login_controller.dart';
import 'package:food_delivery_application/feature/auth/register/view/signup_screen.dart';
import 'package:food_delivery_application/feature/auth/login/view/widgets/social_media_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  ImagePath.backgroundImage,
                  fit: BoxFit.contain,
                ),
              ),
        
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // App Logo....
                      Image.asset(
                        ImagePath.appLogo,
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
                            CustomTextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "Email",
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
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
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              validator: (String? value){
                                if(value==null || value.isEmpty){
                                  return "Please enter password";
                                }
                                else if(value.length<=7){
                                  return " please enter 8 character";
                                }
                                return null;
                              },
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
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: AppColors.lightGreenColor,
                              color: AppColors.lightGreenColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Or Continue With text part....
                       const Padding(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Expanded(child: Divider(color: Colors.white)),
                             Text(
                              "Or Continue With",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                              ),
                             ),
                             Expanded(child: Divider(color: Colors.white)),
                           ],
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
                              image: ImagePath.facebookImg,
                            ),
                            SocialMediaButton(
                              label: "Google",
                              image: ImagePath.googleImg,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      // Button part...
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AppPrimaryButton(
                          title: "Log in",
                          width: double.infinity,
                          onTap: () {
                            if(_formKey.currentState!.validate()){

                            }
                          },
                        ),
                      ),

                      // Don't have an account? signUp....
                      const SizedBox(height: 30),
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

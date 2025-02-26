import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_application/common/buttons/app_primary_button.dart';
import 'package:food_delivery_application/common/snack_bar_message/my_snackbar_message.dart';
import 'package:food_delivery_application/common/text_form_fields/custom_text_field.dart';
import 'package:food_delivery_application/constant/app_colors.dart';
import 'package:food_delivery_application/constant/app_imges.dart';
import 'package:food_delivery_application/modules/auth_module/controller/signup_controller.dart';
import 'package:food_delivery_application/modules/auth_module/views/login_screen.dart';
import 'package:food_delivery_application/modules/auth_module/widgets/required_singup_conditons.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final signupController = Get.find<SignupController>();

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
                top: 60,
                left: 0,
                right: 0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // App Logo....
                      Image.asset(
                        AppImages.appLogo,
                        fit: BoxFit.contain,
                        height: 203,
                        width: 188,
                      ),
                      const SizedBox(height: 30),
                      // Or Continue With text part....
                      const Text(
                        "Sing Up For Free",
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
                              controller: _userNameController,
                              keyboardType: TextInputType.text,
                              hintText: "Name",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: SvgPicture.asset(AppImages.profileIcon),
                              ),
                              validator: (String? value){
                                if(value==null || value.isEmpty){
                                  return "Please enter name";
                                }
                                return null;
                              },

                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Email",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: SvgPicture.asset(AppImages.emailIcon),
                              ),
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
                              obscureText: signupController.obscureText.value,
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "Password",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: SvgPicture.asset(AppImages.lockIcon),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  signupController.obscureText.value =
                                      !signupController.obscureText.value;
                                },
                                icon: Icon(
                                  signupController.obscureText.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RequiredSignupConditions(
                                onTap: () {
                                  signupController.isKeepMeSignInEnabled.value =
                                  !signupController.isKeepMeSignInEnabled.value;
                                },
                                text: 'Keep Me Signed In',
                                color: signupController.isKeepMeSignInEnabled.isTrue
                                        ? AppColors.lightGreenColor
                                        : Colors.transparent,
                                widget: signupController.isKeepMeSignInEnabled.isTrue
                                        ? const Icon(Icons.check,size: 14, color: Colors.white)
                                        : Container(),
                              ),
                              const SizedBox(height: 10),
                              RequiredSignupConditions(
                                onTap: () {
                                  signupController.isEmailMeAboutPricing.value =
                                      !signupController.isEmailMeAboutPricing.value;
                                },
                                text: 'Email Me About Special Pricing',
                                color: signupController.isEmailMeAboutPricing.isTrue
                                        ? AppColors.lightGreenColor
                                        : Colors.transparent,
                                widget: signupController.isEmailMeAboutPricing.isTrue
                                        ? const Icon(Icons.check,size: 14, color: Colors.white)
                                        : Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Button part...
                      AppPrimaryButton(
                        title: "Sign Up",
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            signupController.createAccount(
                              context: context,
                              userName: _userNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            _userNameController.clear();
                            _emailController.clear();
                            _passwordController.clear();

                          }else{
                            mySnackBarMessage('Fill up all the fields!', context);
                          }
                        },
                      ),


                      // Don't have an account? signUp....
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: AppColors.lightGreenColor,
                                  fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(const LoginScreen());
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
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_application/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: obscureText ?? false,
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.start,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: AppColors.textFieldColor,
          contentPadding: const EdgeInsets.all(18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

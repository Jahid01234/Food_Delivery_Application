import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_application/constant/app_colors.dart';

class SocialMediaButton extends StatelessWidget {
  final String label;
  final String image;


  const SocialMediaButton({
    super.key,
    required this.label,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 140,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image,height: 25,width: 25,),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
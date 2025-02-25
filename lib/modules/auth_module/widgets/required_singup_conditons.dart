import 'package:flutter/material.dart';
import 'package:food_delivery_application/constant/app_colors.dart';

class RequiredSignupConditions extends StatelessWidget {
  final String text;
  final Color color;
  final Widget widget;
  final VoidCallback onTap;

  const RequiredSignupConditions({
    super.key,
    required this.text,
    required this.color,
    required this.widget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            decoration:BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.lightGreenColor,
              )
            ),
            child: widget,
          ),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

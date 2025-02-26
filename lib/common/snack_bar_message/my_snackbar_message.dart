import 'package:flutter/material.dart';

void mySnackBarMessage(String message,context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        elevation: 1,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(15),
        content: Text(message),
    ),
  );
}
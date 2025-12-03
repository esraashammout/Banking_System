
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/constant/colors.dart';

Widget buildLoginButton(Size size) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Container(
      width: size.width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: const LinearGradient(
          colors: [primaryColor, pinkColor,secondaryColor,primaryColor,],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.5),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // إضافة منطق تسجيل الدخول هنا
          },
          borderRadius: BorderRadius.circular(30.0),
          child: const Center(
            child: Text(
              'Login to our App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

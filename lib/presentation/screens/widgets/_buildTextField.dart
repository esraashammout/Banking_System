import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/constant/colors.dart';

Widget buildTextField({required String hintText, required IconData icon, bool isPassword = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        // إزالة الحدود الافتراضية وإضافة حدود مستديرة
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: primaryColor, width: 2.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:untitled36/presentation/screens/account_details_screen.dart';

import 'data/constant/colors.dart';

// الألوان التقريبية المستخدمة في التصميم من login_screen.dart

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إعداد وحدة التحكم بالحركة
    _controller = AnimationController(
      duration: const Duration(seconds: 4), // مدة الحركة
      vsync: this,
    );

    // إعداد الحركة (تكبير من 0.5 إلى 1.0)
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // بدء الحركة
    _controller.forward();

    // الانتقال إلى شاشة تسجيل الدخول بعد 3 ثوانٍ
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // استخدام تدرج لوني للخلفية
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor,
              primaryColor,// بنفسجي
              secondaryColor,

            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          // استخدام ScaleTransition لتطبيق الحركة على الأيقونة
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
    ClipOval(
    child: Image.asset(
    "assets/images/download.png",
    width: 350,
    height: 350,
    fit: BoxFit.cover,
    ),
    ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

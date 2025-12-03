import 'package:flutter/material.dart';
import 'package:untitled36/presentation/screens/widgets/CustomShapeClipper.dart';
import 'package:untitled36/presentation/screens/widgets/_buildLoginButton.dart';
import 'package:untitled36/presentation/screens/widgets/_buildTextField.dart';
import '../../data/constant/colors.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: size.height * 0.50, // ارتفاع الجزء العلوي
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                           secondaryColor,
                           primaryColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      primaryColor.withOpacity(0.35), // تموّج بنفسجي خفيف فوق الصورة
                      BlendMode.softLight, // الدمج الناعم مع الخلفية
                    ),
                    child: Opacity(
                      opacity: 0.70, // لتذوب أكثر ضمن التموج
                      child: Image.asset(
                        'assets/images/download.png',                        height: size.height * 0.45,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 30.0, bottom: 0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [primaryColor, pinkColor,secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // يجب أن يكون أبيض ليعمل ShaderMask
                    ),
                  ),
                ),
              ),
            ),
            buildTextField(hintText: 'Enter Username', icon: Icons.person_outline),
            const SizedBox(height: 20.0),
            buildTextField(hintText: 'Enter Password', icon: Icons.lock_outline, isPassword: true),
            const SizedBox(height: 40.0),
            buildLoginButton(size),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // إضافة منطق "نسيت كلمة المرور" هنا
              },
              child: const Text(
                'Forget Password ?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



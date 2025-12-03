import 'package:flutter/cupertino.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    // نقطة البداية
    path.lineTo(5.0, size.height - 50);

    // إنشاء المنحنى الأول (المنحنى الكبير)
    var firstEndPoint = Offset(size.width * 0.5, size.height - 50);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 100);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // إنشاء المنحنى الثاني (المنحنى الصغير)
    var secondEndPoint = Offset(size.width, size.height - 100);
    var secondControlPoint = Offset(size.width * 0.75, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // إغلاق المسار
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

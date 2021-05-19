import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {

  final String imgDir;
  HeaderImage({required this.imgDir});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 300.0,
        width: double.infinity,
        //color: Colors.blue,
        decoration: BoxDecoration(
          image:
          DecorationImage(image: AssetImage("assets/images/virus.png")),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1519A7), Color(0xf82482e3)],
          ),
        ),
        child: Image.asset(this.imgDir),
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

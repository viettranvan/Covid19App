import 'package:flutter/material.dart';

class AppBarLinearGradient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1519A7), Color(0xf82482e3)],
          )
      ),
    );
  }
}

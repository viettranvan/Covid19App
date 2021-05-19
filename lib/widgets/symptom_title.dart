import 'package:flutter/material.dart';

class SymptomTitle extends StatelessWidget {

  final String title;
  SymptomTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        this.title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black),
      ),
    );
  }
}

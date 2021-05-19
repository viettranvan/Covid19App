import 'package:flutter/material.dart';

class ColumnSymptom extends StatelessWidget {
  final String imgDir;
  final String titleSymptom;

  ColumnSymptom({required this.imgDir, required this.titleSymptom});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width: 1.0, color: Colors.grey),
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(this.imgDir), fit: BoxFit.cover)),
        ),
        Text(this.titleSymptom,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ColumnData extends StatelessWidget {

  final String imgDir;
  final String title;
  final Widget number;

  ColumnData({required this.imgDir,required this.title,required this.number});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(this.imgDir,height: 40,width: 40,fit: BoxFit.cover),
        SizedBox(height: 5.0,),
        Text(this.title, style: TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.italic
        ),),
        SizedBox(height: 5.0,),
        this.number
      ],
    );
  }
}

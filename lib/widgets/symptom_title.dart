import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SymptomTitle extends StatelessWidget {

  final String title;
  SymptomTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.0),
          width: 7.0,
          height: 25.0,
          decoration: BoxDecoration(
            color: Color(0xff4ce547)
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            this.title.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
                color: Color(0xff5e19e2)),
          ),
        )
      ],
    );
  }
}

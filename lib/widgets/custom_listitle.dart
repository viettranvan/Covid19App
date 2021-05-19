import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final title;
  final number;

  CustomListTile({this.title,this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [

          Text("Tổng số ca nhiểm: "),
          Text("$number ca nhiễm"),
        ],
      ),
    );
  }
}

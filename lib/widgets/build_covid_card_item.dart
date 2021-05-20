import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CovidCardItem extends StatelessWidget {

  final String title;
  final String imgDir;
  final String number;
  final String imgType;

  CovidCardItem({required this.title,required this.imgDir,required this.imgType,required this.number});


  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("###,###,###");
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blue,
          gradient: LinearGradient(
              colors: [Color(0xFF2E26A7), Color(0xFF006DEA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15.0, vertical: 10.0),
            child: Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Image.asset(
                    this.imgDir,
                    height: 100,
                    width: 100,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(this.imgType,
                        height: 50, width: 50),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(3,5),
                        color: Colors.grey,
                        blurRadius: 4.0
                      )
                    ]
                ),
                child: Text(
                  "${formatter.format(int.parse(this.number))} \nca nhiễm",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

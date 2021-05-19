import 'package:covid_19/widgets/header_image.dart';
import 'package:flutter/material.dart';

class Covid19Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                HeaderImage(
                  imgDir: "assets/images/doctor.png",
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10.0,left: 10.0),
                      child: Icon(
                    Icons.keyboard_backspace_outlined,
                    color: Colors.white,
                    size: 30.0,
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:covid_19/widgets/appbar_linergradient.dart';
import 'package:covid_19/widgets/col_symptom.dart';
import 'package:covid_19/widgets/header_image.dart';
import 'package:covid_19/widgets/symptom_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../graphics.dart';

class Covid19Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Triệu chứng và biện pháp"),
        flexibleSpace: AppBarLinearGradient(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  HeaderImage(
                    imgDir: "assets/images/doctor.png",
                  ),
                ],
              ),
              _buildImportantSymptom, // triệu chứng nghiêm trọng
              SizedBox(height: 20.0,),
              _buildCommonSymptom, // triệu chứng thường gặp
              SizedBox(height: 20.0,),
              _buildUnCommonSymptom, // triệu chứng ít gặp hơn
              SizedBox(height: 10.0,),
              buildHelpCard(context), // Đường dây nóng ...
              SizedBox(height: 10.0,),
              _buildPreventiveMeasures, // biện pháp phòng ngừa

            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildImportantSymptom = Card(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side:  BorderSide(color: Color(0xdddbd4d4))
  ),
  margin: EdgeInsets.symmetric(horizontal: 15.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        SymptomTitle(title: "Triệu chứng nghiêm trọng",),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSymptom(imgUrl: Graphics.shortness_of_breath, titleSymptom: "Khó thở"),
            ColumnSymptom(imgUrl: Graphics.motionless, titleSymptom: "Mất khả năng nói \n hoặc cử động"),
            ColumnSymptom(imgUrl: Graphics.heart_attack, titleSymptom: "Đau hoặc \ntức ngực"),
          ],
        ),
      ],
    ),
  ),
);

Widget _buildCommonSymptom = Card(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side:  BorderSide(color: Color(0xdddbd4d4))
  ),
  margin: EdgeInsets.symmetric(horizontal: 15.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        SymptomTitle(title: "Triệu chứng thường gặp",),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSymptom(imgUrl: Graphics.thermometer, titleSymptom: "Sốt"),
            ColumnSymptom(imgUrl: Graphics.cough, titleSymptom: "Ho khan"),
            ColumnSymptom(imgUrl: Graphics.tired, titleSymptom: "Mệt mỏi"),
          ],
        ),
      ],
    ),
  ),
);

Widget _buildUnCommonSymptom = Card(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side:  BorderSide(color: Color(0xdddbd4d4))
  ),
  margin: EdgeInsets.symmetric(horizontal: 15.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        SymptomTitle(title: "Triệu chứng ít gặp hơn",),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSymptom(imgUrl: Graphics.sore_throat, titleSymptom: "Đau họng"),
            ColumnSymptom(imgUrl: Graphics.headache, titleSymptom: "Đau nhức"),
            ColumnSymptom(imgUrl: Graphics.stomach, titleSymptom: "Tiêu chảy"),
          ],
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSymptom(imgUrl: Graphics.eye, titleSymptom: "Viêm kết mạc"),
            ColumnSymptom(imgUrl: Graphics.nose, titleSymptom: "Mất vị giác\nhoặc khứu giác"),
            ColumnSymptom(imgUrl: Graphics.red, titleSymptom: "Da nổi mẩn"),
          ],
        ),
      ],
    ),
  ),
);

Container buildHelpCard(BuildContext context) {
  return Container(
    height: 150,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 15.0),
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            // left side padding is 40% of total width
            left: MediaQuery.of(context).size.width * .4,
            top: 20,
            right: 20,
          ),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF60BE93),
                Color(0xFF1B8D59),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Đường dây nóng\n1900.90.95\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: "Gọi ngay nếu bạn gặp các triệu chứng trên\n",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SvgPicture.asset("assets/icons/nurse.svg"),
        ),
        Positioned(
          top: 30,
          right: 10,
          child: SvgPicture.asset("assets/icons/virus.svg"),
        ),
      ],
    ),
  );
}

Widget _buildPreventiveMeasures = Card(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: BorderSide(color: Color(0xdddbd4d4))
  ),
  margin: EdgeInsets.symmetric(horizontal: 10.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SymptomTitle(title: "Biện pháp ngăn chặn",),
        SizedBox(height: 10.0,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildMeasureItem(Graphics.measure1),
              _buildMeasureItem(Graphics.measure2),
              _buildMeasureItem(Graphics.measure3),
              _buildMeasureItem(Graphics.measure4),
              _buildMeasureItem(Graphics.measure5),
              _buildMeasureItem(Graphics.measure6),
              _buildMeasureItem(Graphics.measure7),
              _buildMeasureItem(Graphics.measure8),
              _buildMeasureItem(Graphics.measure9),
            ],
          ),
        ),
      ],
    ),
  ),
);

Widget _buildMeasureItem(String imageURL) => CachedNetworkImage(
  imageUrl: imageURL,
  placeholder: (context, url) => Center(child: SizedBox(child: CircularProgressIndicator(),height: 50,width: 50,),),
  imageBuilder: (context, imageProvider) => Container(
    margin: EdgeInsets.only(right: 10.0),
    width: 180,
    height: 250,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: imageProvider,
        fit: BoxFit.cover
      ),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
          width: 1.0,
          color:Color(0xffc2b3b3)
      ),
    ),
  ),
  errorWidget: (context, url, error) => new Icon(Icons.error),
);







import 'package:covid_19/widgets/appbar_linergradient.dart';
import 'package:covid_19/widgets/col_symptom.dart';
import 'package:covid_19/widgets/header_image.dart';
import 'package:covid_19/widgets/symptom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              SymptomTitle(title: "Triệu chứng nghiêm trọng",),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColumnSymptom(imgDir: "assets/images/shortness_of_breath.jpeg", titleSymptom: "Khó thở"),
                    ColumnSymptom(imgDir: "assets/images/motionless.jpg", titleSymptom: "Mất khả năng nói \n hoặc cử động"),
                    ColumnSymptom(imgDir: "assets/images/heart_attack.png", titleSymptom: "Đau hoặc \ntức ngực"),
                  ],
                ),

              ),
              SizedBox(height: 10.0,),
              SymptomTitle(title: "Triệu chứng thường gặp",),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColumnSymptom(imgDir: "assets/images/thermometer.jpg", titleSymptom: "Sốt"),
                    ColumnSymptom(imgDir: "assets/images/cough.jpg", titleSymptom: "Ho khan"),
                    ColumnSymptom(imgDir: "assets/images/tired.jpg", titleSymptom: "Mệt mỏi"),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              SymptomTitle(title: "Triệu chứng ít gặp hơn",),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColumnSymptom(imgDir: "assets/images/sore_throat.png", titleSymptom: "Đau họng"),
                        ColumnSymptom(imgDir: "assets/images/headache.png", titleSymptom: "Đau nhức"),
                        ColumnSymptom(imgDir: "assets/images/stomach.png", titleSymptom: "Tiêu chảy"),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColumnSymptom(imgDir: "assets/images/eye.png", titleSymptom: "Viêm kết mạc"),
                        ColumnSymptom(imgDir: "assets/images/nose.jpg", titleSymptom: "Mất vị giác\nhoặc khứu giác"),
                        ColumnSymptom(imgDir: "assets/images/red.png", titleSymptom: "Da nổi mẩn"),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              SymptomTitle(title: "Biện pháp ngăn chặn",),
              SizedBox(height: 10.0,),
              buildPreventation(),
              SizedBox(height: 10.0,),
              buildHelpCard(context),
              SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}

Row buildPreventation() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      PreventitonCard(
        svgSrc: "assets/icons/hand_wash.svg",
        title: "Rửa tay thường xuyên",
      ),
      PreventitonCard(
        svgSrc: "assets/icons/use_mask.svg",
        title: "Mang Khẩu trang",
      ),
      PreventitonCard(
        svgSrc: "assets/icons/Clean_Disinfect.svg",
        title: "Khử trùng",
      ),
    ],
  );
}

class PreventitonCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventitonCard({
    required this.svgSrc,
    required this.title,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green),
        )
      ],
    );
  }
}

Container buildHelpCard(BuildContext context) {
  return Container(
    height: 150,
    width: double.infinity,
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
                  text: "Dial 999 for \nMedical Help!\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: "If any symptoms appear",
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
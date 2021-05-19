import 'package:covid_19/api/fetch_total_in_world.dart';
import 'package:covid_19/models/total_in_world.dart';
import 'package:covid_19/pages/covid19_information.dart';
import 'package:covid_19/widgets/column_data.dart';
import 'package:covid_19/widgets/header_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FetchTotalInWorld fetchTotalInWorld = new FetchTotalInWorld();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderImage(imgDir: "assets/images/corona_mask.png",),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Số ca nhiếm trên thế giới",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "19/05/2021",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Chi tiết",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 1.0, color: Colors.grey),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 5),
                              color: Colors.grey,
                              blurRadius: 3.0)
                        ]),
                    child: FutureBuilder<TotalInWord>(
                      future: fetchTotalInWorld.fetchDataAllTheWorld(),
                      builder: (context,snapshot){
                        final data = snapshot.data;
                        final formatter = new NumberFormat("###,###,###");
                        if (snapshot.hasData) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ColumnData(
                                imgDir: "assets/images/covid19.png",
                                title: "Tổng số\nca Nhiễm ",
                                number: formatter.format(int.parse("${data!.total}")),
                                color: Colors.blue,
                              ),
                              ColumnData(
                                imgDir: "assets/images/death.png",
                                title: "Số ca \ntử vong",
                                number: formatter.format(int.parse("${data.death}")),
                                color: Colors.red,
                              ),
                              ColumnData(
                                imgDir: "assets/images/recuperate.png",
                                title: "Số ca \nhồi phục",
                                number: formatter.format(int.parse("${data.recovery}")),
                                color: Colors.green,
                              ),
                            ],
                          );
                        }
                        else if (snapshot.hasError) {
                          print("has error");
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Các quốc gia ghi nhận",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Chi tiết",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/worldmap.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              SizedBox(height: 10.0),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Thông tin về Covid-19",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            final pageRoute = MaterialPageRoute(builder: (context) => Covid19Information());
                            Navigator.of(context).push(pageRoute);
                          },
                          child: Text(
                            "Chi tiết",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 200.0,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/nurse.svg",
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset("assets/images/virus.png"),
                      Align(
                        child: Image.asset(
                          "assets/images/covid19.png",
                          height: 80,
                          width: 80,
                        ),
                        alignment: Alignment.centerRight,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

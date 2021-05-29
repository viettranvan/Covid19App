
import 'package:covid_19/api/fetch_total_in_world.dart';
import 'package:covid_19/models/total_in_world.dart';
import 'package:covid_19/widgets/appbar_linergradient.dart';
import 'package:covid_19/widgets/build_covid_card_item.dart';
import 'package:covid_19/widgets/header_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CovidCasesInTheWordPage extends StatefulWidget {
  @override
  _CovidCasesInTheWordPageState createState() =>
      _CovidCasesInTheWordPageState();
}

class _CovidCasesInTheWordPageState extends State<CovidCasesInTheWordPage> {
  FetchTotalInWorld fetchTotalInWorld = new FetchTotalInWorld();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Tình hình trên thế giới"),
          centerTitle: true,
          flexibleSpace: AppBarLinearGradient()),
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xDA51116C),
            gradient: LinearGradient(colors: [
              Color(0xFFA526D5),
              Color(0xFF5F1F78),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder<TotalInWord>(
              future: fetchTotalInWorld.fetchDetailTotalInWorld(),
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          HeaderImage(
                              imgDir:
                                  "assets/images/worldmap_nobackground.png"),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CovidCardItem(
                          title: "TỔNG SỐ CA NHIỄM MỚI TRÊN THẾ GIỚI",
                          imgDir: "assets/images/covid19.png",
                          imgType: "assets/images/new.png",
                          number: "${data!.newConfirmed}"),
                      SizedBox(
                        height: 15.0,
                      ),
                      CovidCardItem(
                          title: "TỔNG SỐ CA NHIỄM TRÊN TOÀN THẾ GIỚI",
                          imgDir: "assets/images/covid19.png",
                          imgType: "assets/images/new.png",
                          number: "${data.totalConfirmed}"),
                      SizedBox(
                        height: 15.0,
                      ),
                      CovidCardItem(
                          title: "SỐ CA TỬ VONG MỚI",
                          imgDir: "assets/images/death.png",
                          imgType: "assets/images/new.png",
                          number: "${data.newDeaths}"),
                      SizedBox(
                        height: 15.0,
                      ),
                      CovidCardItem(
                          title: "TỔNG SỐ CA TỬ VONG",
                          imgDir: "assets/images/death.png",
                          imgType: "assets/images/new.png",
                          number: "${data.totalDeaths}"),
                      SizedBox(
                        height: 15.0,
                      ),
                      CovidCardItem(
                          title: "SỐ CA HỒI PHỤC MỚI",
                          imgDir: "assets/images/recuperate.png",
                          imgType: "assets/images/new.png",
                          number: "${data.newRecovered}"),
                      SizedBox(
                        height: 15.0,
                      ),
                      CovidCardItem(
                          title: "TỔNG SỐ CA HỒI PHỤC",
                          imgDir: "assets/images/recuperate.png",
                          imgType: "assets/images/new.png",
                          number: "${data.totalRecovered}"),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  print("has error");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:covid_19/models/total_in_world.dart';
import 'package:covid_19/widgets/build_covid_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class CovidCasesInTheWordPage extends StatefulWidget {
  @override
  _CovidCasesInTheWordPageState createState() =>
      _CovidCasesInTheWordPageState();
}

class _CovidCasesInTheWordPageState extends State<CovidCasesInTheWordPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xDA51116C),
            gradient: LinearGradient(colors: [
              Color(0xFFA526D5),
              Color(0xFF5F1F78),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SafeArea(
          child: SingleChildScrollView (
            child: FutureBuilder<TotalInWord>(
              future: fetchCovidAPI(),
              builder: (context,snapshot){
                final data = snapshot.data;
                if(snapshot.hasData){
                  return Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      CovidCardItem(
                          title: "TỔNG SỐ CA NHIỄM MỚI TRÊN THẾ GIỚI",
                          imgDir: "assets/images/covid19.png",
                          imgType: "assets/images/new.png",
                          number: "${data!.newConfirmed}"),
                      SizedBox(height: 15.0,),
                      CovidCardItem(
                          title: "TỔNG SỐ CA NHIỄM TRÊN TOÀN THẾ GIỚI",
                          imgDir: "assets/images/covid19.png",
                          imgType: "assets/images/new.png",
                          number: "${data.totalConfirmed}"),
                      SizedBox(height: 15.0,),
                      CovidCardItem(
                          title: "SỐ CA TỬ VONG MỚI",
                          imgDir: "assets/images/death.png",
                          imgType: "assets/images/new.png",
                          number: "${data.newDeaths}"),
                      SizedBox(height: 15.0,),
                      CovidCardItem(
                          title: "TỔNG SỐ CA TỬ VONG",
                          imgDir: "assets/images/death.png",
                          imgType: "assets/images/new.png",
                          number: "${data.totalDeaths}"),
                      SizedBox(height: 15.0,),
                      CovidCardItem(
                          title: "SỐ CA HỒI PHỤC MỚI",
                          imgDir: "assets/images/recuperate.png",
                          imgType: "assets/images/new.png",
                          number: "${data.newRecovered}"),
                      SizedBox(height: 15.0,),
                      CovidCardItem(
                          title: "TỔNG SỐ CA HỒI PHỤC",
                          imgDir: "assets/images/recuperate.png",
                          imgType: "assets/images/new.png",
                          number: "${data.totalRecovered}"),
                      SizedBox(height: 15.0,),
                    ],
                  );
                }else if (snapshot.hasError) {
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

Future<TotalInWord> fetchCovidAPI() async{
  TotalInWord totalInWord ;
  final url = Uri.parse("https://api.covid19api.com/summary");
  final response = await http.get(url);

  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    final global = data["Global"];
    totalInWord = new TotalInWord(
      newConfirmed: global["NewConfirmed"],
      totalConfirmed: global["TotalConfirmed"],
      newDeaths: global["NewDeaths"],
      totalDeaths: global["TotalDeaths"],
      newRecovered: global["NewRecovered"],
      totalRecovered: global["TotalRecovered"]
    );
    return totalInWord;
  }else{
    throw Exception();
  }
  // .then((response){
  //   final data = jsonDecode(response.body);
  //   final global = data["Global"];
  //   final newConfirmed = global["NewConfirmed"];
  //   print("data new: $newConfirmed");
  // });

  // NewConfirmed: 416478,
  // TotalConfirmed: 162823237,
  // NewDeaths: 7548,
  // TotalDeaths: 3376922,
  // NewRecovered: 518516,
  // TotalRecovered: 99037236,
  // Date: "2021-05-17T08:56:26.124Z"

}

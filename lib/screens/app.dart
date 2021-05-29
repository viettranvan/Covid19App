import 'dart:async';

import 'package:covid_19/api/fetch_total_in_world.dart';
import 'package:covid_19/models/total_in_world.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TotalInWord data = new TotalInWord();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_){
      _fetchData();

      Timer(Duration(seconds: 3),() =>
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage(totalInWord: data,))
          )
      );
    });
  }

  _fetchData() async{
    FetchTotalInWorld fetchTotalInWorld = new FetchTotalInWorld();
    data = await fetchTotalInWorld.fetchDataAllTheWorld();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          gradient: LinearGradient(
            colors: [
              Color(0xff251782),
              Color(0xff624bfc),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Expanded(
          child: Column(
            children: [
              Image.asset("assets/images/splash_bg.png",height: 600,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vui lòng chờ",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),),
                  SizedBox(width: 10.0,),
                  SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(color: Colors.white,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

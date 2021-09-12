import 'dart:async';

import 'package:covid_19/api/fetch_total_in_world.dart';
import 'package:covid_19/models/total_in_world.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_offline/flutter_offline.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TotalInWord data = new TotalInWord();

  bool hasData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _fetchData();
    });
  }

  _fetchData() async {
    print("data2: *** $data");
    FetchTotalInWorld fetchTotalInWorld = new FetchTotalInWorld();
    data = await fetchTotalInWorld.fetchDataAllTheWorld();
    print("data3: *** $data");
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(
              totalInWord: data,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              gradient: LinearGradient(colors: [
                Color(0xff251782),
                Color(0xff624bfc),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Column(
            children: [
              Image.asset(
                "assets/images/splash_bg.png",
                height: 600,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vui lòng chờ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        connectivityBuilder:
            (BuildContext context, ConnectivityResult value, Widget child) {
          final bool isConnected = value != ConnectivityResult.none;
          if (isConnected) {
            _fetchData();
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              child,
              isConnected ? SizedBox() :
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  height: 25.0,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Không có kết nối internet"),
                      SizedBox(width: 10.0,),
                      SizedBox(
                        height: 15.0,
                        width: 15.0,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:covid_19/api/fetch_total_in_world.dart';
import 'package:covid_19/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'models/total_in_world.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
/*
class Covid19 extends StatefulWidget {
  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  FetchTotalInWorld fetchTotalInWorld = new FetchTotalInWorld();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19"),
        centerTitle: true,
      ),
      body: FutureBuilder<TotalInWord>(
        future: fetchTotalInWorld.fetchDataAllTheWorld(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.hasData) {
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Statistics around the world",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Total: ${data!.total}"),
                Text("Death: ${data.death}"),
                Text("Recovery: ${data.recovery}"),
              ],
            ));
          } else if (snapshot.hasError) {
            print("has error");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
*/
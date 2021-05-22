import 'package:covid_19/widgets/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_offline/flutter_offline.dart';


class CovidCountryList extends StatefulWidget {

  @override
  _CovidCountryListState createState() => _CovidCountryListState();
}

class _CovidCountryListState extends State<CovidCountryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: CheckConnectivity(
            childWidget: Text("ajnkajnd"),)
          ),
        );
  }
}




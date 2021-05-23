import 'package:flutter/material.dart';

class CountryDetail extends StatefulWidget {
  //const CountryDetail({Key key}) : super(key: key);

  final String countryName;
  CountryDetail({required this.countryName});
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
      ),
      body: Center(child: Text("This is detail page"),),
    );
  }
}

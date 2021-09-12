import 'package:covid_19/main.dart';
import 'package:covid_19/models/total_in_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

class CountryDetail extends StatefulWidget {
  //const CountryDetail({Key key}) : super(key: key);

  final TotalInCountry countryDetail;

  CountryDetail({required this.countryDetail});

  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryDetail.countryName),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Tình hình Covid-19 ở ${widget.countryDetail.countryName}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
          SizedBox(height: 15.0),
          CountryDetailItem(
            imgDir: 'assets/images/covid19.png',
            title: "Số ca nhiễm mới",
            number: '${widget.countryDetail.newConfirmed}',
          ),
          SizedBox(height: 10.0),
          CountryDetailItem(
            imgDir: 'assets/images/covid19.png',
            title: "Tổng số ca nhiễm",
            number: '${widget.countryDetail.totalConfirmed}',
          ),
          SizedBox(height: 10.0),
          CountryDetailItem(
            imgDir: 'assets/images/death.png',
            title: "Số ca tử vong mới",
            number: '${widget.countryDetail.newDeaths}',
          ),
          SizedBox(height: 10.0),
          CountryDetailItem(
            imgDir: 'assets/images/death.png',
            title: "Tổng số ca tử vong",
            number: '${widget.countryDetail.totalDeaths}',
          ),
          SizedBox(height: 10.0),
          CountryDetailItem(
            imgDir: 'assets/images/recuperate.png',
            title: "Số ca hồi phục mới",
            number: '${widget.countryDetail.newRecovered}',
          ),
          SizedBox(height: 10.0),
          CountryDetailItem(
            imgDir: 'assets/images/recuperate.png',
            title: "Tổng số ca hồi phục",
            number: '${widget.countryDetail.totalRecovered}',
          ),
        ],
      ),
    );
  }
}

class CountryDetailItem extends StatelessWidget {
  final String number;
  final String imgDir;
  final String title;

  CountryDetailItem(
      {required this.imgDir, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset(this.imgDir, height: 40, width: 40, fit: BoxFit.cover),
            Text(this.title),
          ],
        ),
        Text(
          this.number,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

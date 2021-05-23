import 'package:covid_19/api/fetch_total_country.dart';
import 'package:covid_19/models/total_in_country.dart';
import 'package:covid_19/pages/country_detail.dart';
import 'package:covid_19/widgets/appbar_linergradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class CovidCountryList extends StatefulWidget {
  @override
  _CovidCountryListState createState() => _CovidCountryListState();
}

class _CovidCountryListState extends State<CovidCountryList> {
  FetchTotalInCountry fetchTotalInCountry = new FetchTotalInCountry();
  final formatter = new NumberFormat("###,###,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách quốc gia ghi nhận"),
        flexibleSpace: AppBarLinearGradient(),
      ),
      body: SafeArea(
          child: FutureBuilder<List<TotalInCountry>>(
        future: fetchTotalInCountry.fetchDataInCountry(),
        builder: (context, snapshot) {
          List<TotalInCountry>? data = snapshot.data;
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildColumnTitle("Quốc gia", 200.0),
                        _buildColumnTitle("Tổng", 100.0),
                        _buildColumnTitle("Tử vong", 100.0),
                        _buildColumnTitle("Hồi phục", 100.0),
                        _buildColumnTitle("Chi tiết", 100.0),
                      ],
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: data!.map((item) {
                            return Row(
                              children: [
                                _buildDataItem("${item.countryName}", 200.0, Colors.black),
                                _buildDataItem(
                                    "${formatter.format(int.parse("${item.totalConfirmed}"))}", 100.0,Colors.blue),
                                _buildDataItem("${formatter.format(int.parse("${item.totalDeaths}"))}", 100.0,Colors.red),
                                _buildDataItem(
                                    "${formatter.format(int.parse("${item.totalRecovered}"))}", 100.0,Colors.green),
                                InkWell(
                                  child: _buildDataItem("Chi tiết", 100.0,Colors.blueAccent),
                                  onTap: (){
                                    final pageRoute = MaterialPageRoute(builder: (context) => CountryDetail(countryName: item.countryName));
                                    Navigator.of(context).push(pageRoute);
                                  },
                                ),

                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            print("has error");
          }

          return Center(child: CircularProgressIndicator(),);
        },
      )),
    );
  }

  Widget _buildColumnTitle(String title, double width) => Container(
        width: width,
        height: 50,
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget _buildDataItem(String title, double width, Color color) => Container(
    width: width,
    height: 50,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(
        color: Colors.grey,width:2.0
      ))
    ),
    child: Center(
      child: Text(
        "$title",
        style: TextStyle(fontSize: 16.0,color: color),
      ),
    ),
  );
}

import 'package:covid_19/api/fetch_total_country.dart';
import 'package:covid_19/models/total_in_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CovidCountryList extends StatefulWidget {
  @override
  _CovidCountryListState createState() => _CovidCountryListState();
}

class _CovidCountryListState extends State<CovidCountryList> {
  FetchTotalInCountry fetchTotalInCountry = new FetchTotalInCountry();
  int? sortColumnIndex;
  bool isAscending = false;
  final _titleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<List<TotalInCountry>>(
        future: fetchTotalInCountry.fetchDataInCountry(),
        builder: (context, snapshot) {
          List<TotalInCountry>? data = snapshot.data;
          if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Quốc gia",style: _titleStyle,)),
                    DataColumn(label: Text("Tổng",style: _titleStyle)),
                    DataColumn(label: Text("Tử vong",style: _titleStyle)),
                    DataColumn(label: Text("Hồi Phục",style: _titleStyle)),
                    DataColumn(label: Text(" ")),
                  ],
                  rows: data!
                      .map((item) => DataRow(cells: [
                            DataCell(Text(item.countryName)),
                            DataCell(Text(item.totalConfirmed)),
                            DataCell(Text(item.totalDeaths)),
                            DataCell(Text(item.totalRecovered)),
                            DataCell(InkWell(
                                onTap: () => print("${item.totalRecovered}"),
                                child: Text("Chi Tiết",style: TextStyle(color: Colors.blue),))),
                          ]))
                      .toList(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            print("has error");
          }

          return CircularProgressIndicator();
        },
      )),
    );
  }
}

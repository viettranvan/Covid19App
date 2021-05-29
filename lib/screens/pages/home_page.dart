import 'package:covid_19/api/fetch_total_in_world.dart';
import 'package:covid_19/models/total_in_world.dart';
import 'package:covid_19/widgets/appbar_linergradient.dart';
import 'package:covid_19/widgets/column_data.dart';
import 'package:covid_19/widgets/connectivity.dart';
import 'package:covid_19/widgets/header_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'covid19_information.dart';
import 'covid_cases_in_the_world_page.dart';
import 'covid_country_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  final TotalInWord totalInWord;

  HomePage({required this.totalInWord});
}

class _HomePageState extends State<HomePage> {
  FetchTotalInWorld fetchTotalInWorld = new FetchTotalInWorld();

  TotalInWord totalData = new TotalInWord();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalData = widget.totalInWord;
    print("intt data: ${widget.totalInWord}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            FetchTotalInWorld fetchTotalInWorld = new FetchTotalInWorld();
            TotalInWord newData = new TotalInWord();
            newData = await fetchTotalInWorld.fetchDataAllTheWorld();
            setState(() {
              totalData = newData;
              print("new data: ${newData.totalRecovered}");
            });
          },
          child: CheckConnectivity(
            childWidget: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderImage(
                    imgDir: "assets/images/corona_mask.png",
                  ),
                  Column(
                    children: [
                      _totalCaseInWorldTitleContainer(context),
                      SizedBox(
                        height: 15.0,
                      ),
                      _totalCaseInWorldContainer(totalData),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _covidCountriesConfirmTitle(context),
                  SizedBox(height: 10.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/worldmap.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  SizedBox(height: 10.0),
                  _covidInformation(context),
                  SizedBox(height: 20.0),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      height: 200.0,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/nurse.svg",
                            fit: BoxFit.fitHeight,
                          ),
                          Image.asset("assets/images/virus.png"),
                          Align(
                            child: Image.asset(
                              "assets/images/covid19.png",
                              height: 80,
                              width: 80,
                            ),
                            alignment: Alignment.centerRight,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Covid19"),
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              Text("$formattedDate"),
            ],
          ),
        ),
      ],
    ),
    flexibleSpace: AppBarLinearGradient(),
    //backgroundColor: Color(0xFF1519A7),
  );
}

Widget _totalCaseInWorldTitleContainer(BuildContext context) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Số ca nhiếm trên thế giới",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              "$formattedDate",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            final pageRoute = MaterialPageRoute(
                builder: (context) => CovidCasesInTheWordPage());
            Navigator.of(context).push(pageRoute);
            //print("go to covid case in world pages");
          },
          child: Text(
            "Chi tiết",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
        )
      ],
    ),
  );
}
Widget _totalCaseInWorldContainer(TotalInWord totalInWord) {

  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0),
    margin: EdgeInsets.symmetric(horizontal: 20.0),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 1.0, color: Colors.grey),
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(1, 5), color: Colors.grey, blurRadius: 3.0)
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ColumnData(
          imgDir: "assets/images/covid19.png",
          title: "Tổng số\nca Nhiễm ",
          number:  totalInWord.totalRecovered != null ? _textData(
              int.parse(totalInWord.totalConfirmed),
              Colors.blue) :
            CircularProgressIndicator(color: Colors.blue,)
        ),
        ColumnData(
          imgDir: "assets/images/death.png",
          title: "Số ca \ntử vong",
          number: totalInWord.totalRecovered != null ? _textData(
              int.parse(totalInWord.totalDeaths),
              Colors.red):
          CircularProgressIndicator(color: Colors.red,)
        ),
        ColumnData(
          imgDir: "assets/images/recuperate.png",
          title: "Số ca \nhồi phục",
          number: totalInWord.totalRecovered != null ? _textData(
              int.parse(totalInWord.totalRecovered),
              Colors.green):
          CircularProgressIndicator(color:  Colors.green,)
        ),
      ],
    ),
  );
}

Widget _textData(int number, Color color) {
  final formatter = new NumberFormat("###,###,###");
  return Text(formatter.format(number),
      style:
          TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: color));
}

Widget _covidCountriesConfirmTitle(BuildContext context) => Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Các quốc gia ghi nhận",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  final pageRoute = MaterialPageRoute(
                      builder: (context) => CovidCountryList());
                  Navigator.of(context).push(pageRoute);
                },
                child: Text(
                  "Chi tiết",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ],
    );

Widget _covidInformation(BuildContext context) => Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thông tin về Covid-19",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  final pageRoute = MaterialPageRoute(
                      builder: (context) => Covid19Information());
                  Navigator.of(context).push(pageRoute);
                },
                child: Text(
                  "Chi tiết",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ],
    );

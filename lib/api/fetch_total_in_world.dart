import 'dart:convert';
import 'package:covid_19/models/total_in_world.dart';
import 'package:http/http.dart' as http;

class FetchTotalInWorld{
  //TotalInWord totalInWord = new TotalInWord();

  Future<TotalInWord> fetchDataAllTheWorld() async{
    Uri url = Uri.parse("https://api.covid19api.com/world/total");
    TotalInWord totalData;
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final fetchData = jsonDecode(response.body);
      totalData = new TotalInWord(
        totalConfirmed: "${fetchData["TotalConfirmed"]}",
        totalDeaths: "${fetchData["TotalDeaths"]}",
        totalRecovered: "${fetchData["TotalRecovered"]}",
      );
      print("$fetchData");
      return totalData;

    }else{
      throw Exception();
    }
  }

  Future<TotalInWord> fetchDetailTotalInWorld() async {
    TotalInWord totalInWord;
    final url = Uri.parse("https://api.covid19api.com/summary");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final global = data["Global"];
      totalInWord = new TotalInWord(
          newConfirmed: global["NewConfirmed"],
          totalConfirmed: global["TotalConfirmed"],
          newDeaths: global["NewDeaths"],
          totalDeaths: global["TotalDeaths"],
          newRecovered: global["NewRecovered"],
          totalRecovered: global["TotalRecovered"]);
      return totalInWord;
    } else {
      throw Exception();
    }

  }
}


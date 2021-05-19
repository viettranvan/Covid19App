import 'dart:convert';
import 'package:covid_19/models/total_in_world.dart';
import 'package:http/http.dart' as http;

class FetchTotalInWorld{
  TotalInWord totalInWord = new TotalInWord();

  Future<TotalInWord> fetchDataAllTheWorld() async{
    Uri url = Uri.parse("https://api.covid19api.com/world/total");
    TotalInWord totalData;
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final fetchData = jsonDecode(response.body);
      totalData = new TotalInWord(
        total: "${fetchData["TotalConfirmed"]}",
        death: "${fetchData["TotalDeaths"]}",
        recovery: "${fetchData["TotalRecovered"]}",
      );
      print("$fetchData");
      return totalData;

    }else{
      throw Exception();
    }
  }
}


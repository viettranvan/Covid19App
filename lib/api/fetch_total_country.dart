import 'dart:convert';
import 'package:covid_19/models/total_in_country.dart';
import 'package:http/http.dart' as http;

class FetchTotalInCountry{

  Future<List<TotalInCountry>> fetchDataInCountry() async{
    Uri url = Uri.parse("https://api.covid19api.com/summary");
    List<TotalInCountry> totalDataInCountries = <TotalInCountry>[];
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final fetchData = jsonDecode(response.body);

      List countries = fetchData["Countries"];

      countries.forEach((item) {
        TotalInCountry totalData = new TotalInCountry(
            countryName: "${item["Country"]}",
            newConfirmed: "${item["NewConfirmed"]}",
            totalConfirmed: "${item["TotalConfirmed"]}",
            newDeaths:"${item["NewDeaths"]}",
            totalDeaths: "${item["TotalDeaths"]}",
            newRecovered: "${item["NewRecovered"]}",
            totalRecovered: "${item["TotalRecovered"]}",
            date: "${item["Date"]}"
        );
        totalDataInCountries.add(totalData);

      });

      return totalDataInCountries;

    }else{
      throw Exception();
    }
  }
}


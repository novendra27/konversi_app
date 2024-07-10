import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/country_model.dart';
import '../models/forex_model.dart';

class ApiController {
  static const String baseUrl = "https://api.rawp.info/forex";

  Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse('$baseUrl?country'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<Forex> fetchForexRates(String currency) async {
    final response = await http.get(Uri.parse('$baseUrl?currency=$currency'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Forex.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load forex rates');
    }
  }
}

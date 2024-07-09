import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/forex_model.dart';

class ForexController {
  Future<Forex> fetchForexByCurrency(String currency) async {
    final response = await http.get(Uri.parse('https://api.rawp.info/forex?currency=$currency'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Forex.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load forex data');
    }
  }

  Future<List<CountryForex>> fetchForexByCountry() async {
    final response = await http.get(Uri.parse('https://api.rawp.info/forex/?country'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => CountryForex.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load country forex data');
    }
  }
}

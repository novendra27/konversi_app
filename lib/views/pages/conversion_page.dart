import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_controller.dart';
import '../../models/country_model.dart';
import '../../models/forex_model.dart';
import '../../theme/app_pallete.dart';
import '../widgets/bottom_app_bar_widget.dart';
import '../widgets/conversion_result.dart';
import '../widgets/country_dropdown.dart';


class ConversionPage extends StatefulWidget {

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  late TextEditingController _amountController;
  Country? _sourceCountry;
  Country? _targetCountry;
  late Future<List<Country>> futureCountries;
  Future<Forex>? futureForexRates;  // Make futureForexRates nullable

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    futureCountries = Provider.of<ApiController>(context, listen: false).fetchCountries();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _convertCurrency() {
    if (_sourceCountry != null && _targetCountry != null) {
      setState(() {
        futureForexRates = Provider.of<ApiController>(context, listen: false)
            .fetchForexRates(_sourceCountry!.currencyCode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: TextStyle(color: AppPallete.white),
        ),
        backgroundColor: AppPallete.colorPrimary,
      ),
      bottomNavigationBar: bottomAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder<List<Country>>(
              future: futureCountries,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No countries found'));
                } else {
                  return Column(
                    children: [
                      CountryDropdown(
                        countries: snapshot.data!,
                        selectedCountry: _sourceCountry,
                        onChanged: (value) {
                          setState(() {
                            _sourceCountry = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      CountryDropdown(
                        countries: snapshot.data!,
                        selectedCountry: _targetCountry,
                        onChanged: (value) {
                          setState(() {
                            _targetCountry = value;
                          });
                        },
                      ),
                    ],
                  );
                }
              },
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            futureForexRates == null
                ? Container()
                : FutureBuilder<Forex>(
                    future: futureForexRates,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return Center(child: Text('No data available'));
                      } else {
                        final rate = snapshot.data!.rates[_targetCountry!.currencyCode];
                        final amount = double.parse(_amountController.text);
                        final convertedAmount = amount * rate;

                        return ConversionResult(
                          fromCountry: _sourceCountry!.country,
                          toCountry: _targetCountry!.country,
                          amount: amount,
                          convertedAmount: convertedAmount,
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

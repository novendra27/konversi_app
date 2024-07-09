import 'package:flutter/material.dart';
import 'package:konversi_app/views/widgets/conversion_result_widget.dart';
import 'package:konversi_app/views/widgets/search_input_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _dummySearch(String input) {
    // This is a dummy function to simulate search
    print("Searching for $input");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forex Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchInput(
              label: 'Currency',
              onSearch: _dummySearch,
            ),
            ConversionResult(
              title: 'Currency Result',
              result: 'Currency: USD, Rate: 1.23',
            ),
            SearchInput(
              label: 'Country',
              onSearch: _dummySearch,
            ),
            ConversionResult(
              title: 'Country Result',
              result: 'Country: USA, Currency: USD, Rate: 1.23',
            ),
          ],
        ),
      ),
    );
  }
}

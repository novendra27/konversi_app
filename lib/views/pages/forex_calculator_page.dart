import 'package:flutter/material.dart';
import 'package:konversi_app/views/widgets/conversion_result_widget.dart';
import 'package:konversi_app/views/widgets/search_input_widget.dart';

class ForexCalculatorPage extends StatefulWidget {
  @override
  _ForexCalculatorPageState createState() => _ForexCalculatorPageState();
}

class _ForexCalculatorPageState extends State<ForexCalculatorPage> {
  final _amountController = TextEditingController();

  void _dummyConvert() {
    // This is a dummy function to simulate conversion
    print("Converting amount: ${_amountController.text}");
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
              label: 'From Currency',
              controller: TextEditingController(),
            ),
            SearchInput(
              label: 'To Currency',
              controller: TextEditingController(),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _dummyConvert,
              child: Text('Convert'),
            ),
            ConversionResult(
              title: 'Conversion Result',
              result: 'Conversion Result: 123.45',
            ),
          ],
        ),
      ),
    );
  }
}

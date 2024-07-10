import 'package:flutter/material.dart';

class ConversionResult extends StatelessWidget {
  final String fromCountry;
  final String toCountry;
  final double amount;
  final double convertedAmount;

  ConversionResult({
    required this.fromCountry,
    required this.toCountry,
    required this.amount,
    required this.convertedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('From: $fromCountry'),
        Text('To: $toCountry'),
        Text('Amount: $amount'),
        Text('Converted Amount: $convertedAmount'),
      ],
    );
  }
}

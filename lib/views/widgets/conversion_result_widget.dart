import 'package:flutter/material.dart';

class ConversionResult extends StatelessWidget {
  final String title;
  final String result;

  ConversionResult({required this.title, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(result),
      ],
    );
  }
}

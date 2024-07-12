import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../theme/app_pallete.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      decoration: BoxDecoration(
        color: AppPallete.colorPrimary.withOpacity(0.87),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textResult(label: 'From', value: fromCountry),
          textResult(label: 'To', value: toCountry),
          textResult(label: 'Amount', value: amount.toString()),
          const Gap(5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppPallete.colorGray,),
            ),
          ),
          const Gap(5),
          textResult(label: 'Result', value: convertedAmount.toString()),
        ],
      ),
    );
  }

  Container textResult({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppPallete.white,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppPallete.white,
            ),
          ),
        ],
      ),
    );
  }
}

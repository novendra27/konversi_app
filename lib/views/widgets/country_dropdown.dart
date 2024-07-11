import 'package:flutter/material.dart';

import '../../models/country_model.dart';
import '../../theme/app_pallete.dart';

class CountryDropdown extends StatelessWidget {
  final List<Country> countries;
  final Country? selectedCountry;
  final ValueChanged<Country?> onChanged;

  CountryDropdown({
    required this.countries,
    required this.selectedCountry,
    required this.onChanged,
  });

 @override
  Widget build(BuildContext context) {
    return DropdownButton<Country>(
      dropdownColor: AppPallete.colorPrimary.withOpacity(0.9),
      icon: Icon(Icons.arrow_drop_down, color: AppPallete.white),
      isExpanded: true,
      value: selectedCountry,
      hint: Text('Select a country', style: TextStyle(color: AppPallete.white)),
      onChanged: onChanged,
      items: countries.map(
        (Country country) {
          return DropdownMenuItem<Country>(
            value: country,
            child: Text(
              country.country,
              style: TextStyle(color: AppPallete.white),
              overflow: TextOverflow.ellipsis, // Added to prevent overflow
            ),
          );
        },
      ).toList(),
    );
  }
}
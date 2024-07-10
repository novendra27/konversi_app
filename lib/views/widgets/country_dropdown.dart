import 'package:flutter/material.dart';

import '../../models/country_model.dart';

class CountryDropdown extends StatelessWidget {
  final List<Country> countries;
  final Country? selectedCountry;
  final ValueChanged<Country?> onChanged;

  CountryDropdown({required this.countries, this.selectedCountry, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Country>(
      decoration: InputDecoration(labelText: 'Target Country'),
      value: selectedCountry,
      items: countries.map((Country country) {
        return DropdownMenuItem<Country>(
          value: country,
          child: Text(country.country),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

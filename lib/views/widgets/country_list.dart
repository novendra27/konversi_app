import 'package:flutter/material.dart';

import '../../models/country_model.dart';
import '../pages/conversion_page.dart';

class CountryList extends StatelessWidget {
  final List<Country> countries;

  CountryList({required this.countries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return ListTile(
          leading: Image.network(country.img),
          title: Text(country.country),
          subtitle: Text(country.currency),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConversionPage(
                  country: country,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
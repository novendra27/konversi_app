import 'package:flutter/material.dart';

class CountrySearch extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  CountrySearch({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Search Country',
        border: UnderlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: onSearch,
        ),
      ),
    );
  }
}

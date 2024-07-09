import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onSearch;

  SearchInput({required this.label, this.controller, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: label),
        ),
        if (onSearch != null)
          ElevatedButton(
            onPressed: () {
              final input = controller?.text ?? '';
              onSearch!(input);
            },
            child: Text('Search'),
          ),
      ],
    );
  }
}

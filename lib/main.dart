import 'package:flutter/material.dart';
import 'package:konversi_app/views/pages/conversion_page.dart';
import 'package:provider/provider.dart';

import 'controllers/api_controller.dart';
import 'views/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiController>(create: (_) => ApiController()),
      ],
      child: MaterialApp(
        title: 'Forex Converter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          '/home': (context) => HomePage(),
          '/conversion': (context) => ConversionPage(),
        },
      ),
    );
  }
}

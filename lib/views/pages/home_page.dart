import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_controller.dart';
import '../../models/country_model.dart';
import '../../theme/app_pallete.dart';
import '../widgets/bottom_app_bar_widget.dart';
import '../widgets/country_list.dart';
import '../widgets/country_search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Country>> futureCountries;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    futureCountries =
        Provider.of<ApiController>(context, listen: false).fetchCountries();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forex Currency',
          style: TextStyle(color: AppPallete.white),
        ),
        backgroundColor: AppPallete.colorPrimary,
      ),
      bottomNavigationBar: bottomAppBarWidget(),
      body: Container(
        color: AppPallete.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CountrySearch(
              controller: _searchController,
              onSearch: () {
                setState(() {
                  futureCountries = Provider.of<ApiController>(context,
                          listen: false)
                      .fetchCountries()
                      .then((countries) => countries
                          .where((country) => country.country
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase()))
                          .toList());
                });
              },
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Country List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Expanded(
              child: FutureBuilder<List<Country>>(
                future: futureCountries,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No countries found'));
                  } else {
                    return CountryList(countries: snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

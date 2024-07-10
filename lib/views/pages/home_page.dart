import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_controller.dart';
import '../../models/country_model.dart';
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
    futureCountries = Provider.of<ApiController>(context, listen: false).fetchCountries();
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
        title: Text('Forex App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CountrySearch(
              controller: _searchController,
              onSearch: () {
                setState(() {
                  futureCountries = Provider.of<ApiController>(context, listen: false)
                      .fetchCountries()
                      .then((countries) => countries.where((country) => country.country.toLowerCase().contains(_searchController.text.toLowerCase())).toList());
                });
              },
            ),
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




// import 'package:flutter/material.dart';
// import '../widgets/search_input_widget.dart';
// import '../../controllers/forex_controller.dart';
// import '../../models/forex_model.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final _forexController = ForexController();
//   List<CountryForex>? _countryForexList;

//   void _searchByCountry() async {
//     final countryForexList = await _forexController.fetchForexByCountry();
//     setState(() {
//       _countryForexList = countryForexList;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _searchByCountry();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forex Converter'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'Available Countries',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             SearchInput(
//               label: 'Search Country',
//               onSearch: (value) {
//                 _searchByCountry();
//               },
//             ),
//             Expanded(
//               child: _countryForexList == null
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                       itemCount: _countryForexList!.length,
//                       itemBuilder: (context, index) {
//                         final countryForex = _countryForexList![index];
//                         return ListTile(
//                           title: Text('${countryForex.country} (${countryForex.currencyCode})'),
//                           subtitle: Text('Currency: ${countryForex.currency}'),
//                           leading: Image.network(countryForex.img),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

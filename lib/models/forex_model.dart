class Forex {
  final Map<String, dynamic> rates;

  Forex({required this.rates});

  factory Forex.fromJson(Map<String, dynamic> json) {
    return Forex(
      rates: json['data'][0],
    );
  }
}

class CountryForex {
  final String country;
  final String currency;
  final String currencyCode;
  final String img;

  CountryForex({
    required this.country,
    required this.currency,
    required this.currencyCode,
    required this.img,
  });

  factory CountryForex.fromJson(Map<String, dynamic> json) {
    return CountryForex(
      country: json['country'],
      currency: json['currency'],
      currencyCode: json['currencyCode'],
      img: json['img'],
    );
  }
}

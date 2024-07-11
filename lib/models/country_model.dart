class Country {
  final String code2;
  final String code3;
  final int codeNo;
  final String country;
  final String currency;
  final String currencyCode;
  final String region;
  final String subRegion;
  final String img;

  Country({
    required this.code2,
    required this.code3,
    required this.codeNo,
    required this.country,
    required this.currency,
    required this.currencyCode,
    required this.region,
    required this.subRegion,
    required this.img,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code2: json['code2'] ?? '',
      code3: json['code3'] ?? '',
      codeNo: json['codeNo'] ?? 0,
      country: json['country'] ?? '',
      currency: json['currency'] ?? '',
      currencyCode: json['currencyCode'] ?? '',
      region: json['region'] ?? '',
      subRegion: json['subRegion'] ?? '',
      img: json['img'] ?? '',
    );
  }
}

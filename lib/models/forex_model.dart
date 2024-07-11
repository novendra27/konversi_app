class Forex {
  final Map<String, dynamic> rates;

  Forex({required this.rates});

  factory Forex.fromJson(Map<String, dynamic> json) {
    return Forex(rates: json['data'][0] ?? {});
  }
}
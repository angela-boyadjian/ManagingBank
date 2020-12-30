class VatRates {
  final String name;
  final String rate;
  final String country;

  VatRates(this.name, this.rate, this.country);

  Map<String, Object> toJson() {
    return {
      'name': name,
      'rate': rate,
      'country': country,
    };
  }

  static VatRates fromJson(Map<String, Object> json) {
    return VatRates(
      json['name'] as String,
      json['rate'] as String,
      json['country'] as String,
    );
  }
}

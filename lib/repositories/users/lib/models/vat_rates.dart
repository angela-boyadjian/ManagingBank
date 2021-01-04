class VatRates {
  final String uuid;
  final String name;
  final String rate;
  final String country;

  VatRates(this.uuid, this.name, this.rate, this.country);

  Map<String, Object> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'rate': rate,
      'country': country,
    };
  }

  static VatRates fromJson(Map<String, Object> json) {
    return VatRates(
      json['uuid'] as String,
      json['name'] as String,
      json['rate'] as String,
      json['country'] as String,
    );
  }
}

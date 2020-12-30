class VatExempt {
  final String code;
  final String title;
  final String description;

  VatExempt(this.code, this.title, this.description);

  Map<String, Object> toJson() {
    return {
      'code': code,
      'title': title,
      'description': description,
    };
  }

  static VatExempt fromJson(Map<String, Object> json) {
    return VatExempt(
      json['code'] as String,
      json['title'] as String,
      json['description'] as String,
    );
  }
}

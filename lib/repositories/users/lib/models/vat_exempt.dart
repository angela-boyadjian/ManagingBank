class VatExempt {
  final String uuid;
  final String code;
  final String title;
  final String description;

  VatExempt(this.uuid, this.code, this.title, this.description);

  Map<String, Object> toJson() {
    return {
      'uuid': uuid,
      'code': code,
      'title': title,
      'description': description,
    };
  }

  static VatExempt fromJson(Map<String, Object> json) {
    return VatExempt(
      json['uuid'] as String,
      json['code'] as String,
      json['title'] as String,
      json['description'] as String,
    );
  }
}

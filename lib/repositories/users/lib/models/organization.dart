class Organization {
  final String uuid;
  final String name;

  Organization(this.uuid, this.name);

  Map<String, Object> toJson() {
    return {
      'uuid': uuid,
      'name': name,
    };
  }

  static Organization fromJson(Map<String, Object> json) {
    return Organization(
      json['uuid'] as String,
      json['name'] as String,
    );
  }
}

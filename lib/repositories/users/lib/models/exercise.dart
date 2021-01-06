class Exercise {
  final String uuid;
  final String organizationUuid;
  final String startDate;
  final String endDate;
  final bool locked;

  Exercise(this.uuid, this.organizationUuid, this.startDate, this.endDate,
      this.locked);

  Map<String, Object> toJson() {
    return {
      'uuid': uuid,
      'organization_uuid': organizationUuid,
      'startDate': startDate,
      'endDate': endDate,
      'locked': locked,
    };
  }

  static Exercise fromJson(Map<String, Object> json) {
    return Exercise(
      json['uuid'] as String,
      json['organization_uuid'] as String,
      json['startDate'] as String,
      json['endDate'] as String,
      json['locked'] as bool,
    );
  }
}

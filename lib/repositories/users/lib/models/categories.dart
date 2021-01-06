import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Attributes {
  Attributes({
    this.uuid,
    this.name,
    this.color,
    this.innerCode,
    this.defaultVatRateUuid,
    this.vatDisabled,
    this.children,
    this.parentUuid,
  });

  String uuid;
  String name;
  dynamic color;
  String innerCode;
  String defaultVatRateUuid;
  bool vatDisabled;
  Categories children;
  String parentUuid;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        uuid: json["uuid"],
        name: json["name"],
        color: json["color"],
        innerCode: json["inner_code"],
        defaultVatRateUuid: json["default_vat_rate_uuid"] == null
            ? null
            : json["default_vat_rate_uuid"],
        vatDisabled: json["vat_disabled"] == null ? null : json["vat_disabled"],
        children: json["children"] == null
            ? null
            : Categories.fromJson(json["children"]),
        parentUuid: json["parent_uuid"] == null ? null : json["parent_uuid"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "color": color,
        "inner_code": innerCode,
        "default_vat_rate_uuid":
            defaultVatRateUuid == null ? null : defaultVatRateUuid,
        "vat_disabled": vatDisabled == null ? null : vatDisabled,
        "children": children == null ? null : children.toJson(),
        "parent_uuid": parentUuid == null ? null : parentUuid,
      };
}

class Datum {
  Datum({
    this.id,
    this.type,
    this.attributes,
    this.links,
  });

  String id;
  Type type;
  Attributes attributes;
  Links links;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: typeValues.map[json["type"]],
        attributes: Attributes.fromJson(json["attributes"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "attributes": attributes.toJson(),
        "links": links.toJson(),
      };
}

class Categories {
  Categories({
    this.data,
  });

  List<Datum> data;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Links {
  Links({
    this.logoUrl,
  });

  dynamic logoUrl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        logoUrl: json["logo_url"],
      );

  Map<String, dynamic> toJson() => {
        "logo_url": logoUrl,
      };
}

enum Type { CATEGORY }

final typeValues = EnumValues({"category": Type.CATEGORY});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

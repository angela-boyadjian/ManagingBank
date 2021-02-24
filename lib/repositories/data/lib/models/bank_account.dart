import 'dart:convert';

BankAccount bankAccountFromJson(String str) =>
    BankAccount.fromJson(json.decode(str));

String bankAccountToJson(BankAccount data) => json.encode(data.toJson());

class BankAccount {
  BankAccount({
    this.data,
  });

  List<Datum> data;

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.type,
    this.attributes,
  });

  String id;
  DatumType type;
  DatumAttributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: datumTypeValues.map[json["type"]],
        attributes: DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": datumTypeValues.reverse[type],
        "attributes": attributes.toJson(),
      };
}

class DatumAttributes {
  DatumAttributes({
    this.uuid,
    this.name,
    this.accountNumber,
    this.externalId,
    this.status,
    this.statusCodeInfo,
    this.statusCodeDescription,
    this.enabled,
    this.currentBankBalance,
    this.balance,
    this.cashFlow,
    this.spendings,
    this.earnings,
    this.bank,
  });

  String uuid;
  String name;
  String accountNumber;
  String externalId;
  String status;
  StatusCodeInfo statusCodeInfo;
  dynamic statusCodeDescription;
  bool enabled;
  String currentBankBalance;
  double balance;
  double cashFlow;
  double spendings;
  double earnings;
  Bank bank;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        uuid: json["uuid"],
        name: json["name"],
        accountNumber:
            json["account_number"] == null ? null : json["account_number"],
        externalId: json["external_id"],
        status: json["status"],
        statusCodeInfo: statusCodeInfoValues.map[json["status_code_info"]],
        statusCodeDescription: json["status_code_description"],
        enabled: json["enabled"],
        currentBankBalance: json["current_bank_balance"],
        balance: json["balance"].toDouble(),
        cashFlow: json["cash_flow"].toDouble(),
        spendings: json["spendings"].toDouble(),
        earnings: json["earnings"].toDouble(),
        bank: Bank.fromJson(json["bank"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "account_number": accountNumber == null ? null : accountNumber,
        "external_id": externalId,
        "status": status,
        "status_code_info": statusCodeInfoValues.reverse[statusCodeInfo],
        "status_code_description": statusCodeDescription,
        "enabled": enabled,
        "current_bank_balance": currentBankBalance,
        "balance": balance,
        "cash_flow": cashFlow,
        "spendings": spendings,
        "earnings": earnings,
        "bank": bank.toJson(),
      };
}

class Bank {
  Bank({
    this.data,
  });

  Data data;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.type,
    this.attributes,
    this.links,
  });

  String id;
  DataType type;
  DataAttributes attributes;
  Links links;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: dataTypeValues.map[json["type"]],
        attributes: DataAttributes.fromJson(json["attributes"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": dataTypeValues.reverse[type],
        "attributes": attributes.toJson(),
        "links": links.toJson(),
      };
}

class DataAttributes {
  DataAttributes({
    this.id,
    this.uuid,
    this.name,
    this.countryCode,
    this.balance,
    this.cashFlow,
    this.spendings,
    this.earnings,
  });

  int id;
  String uuid;
  String name;
  CountryCode countryCode;
  double balance;
  double cashFlow;
  double spendings;
  double earnings;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        countryCode: countryCodeValues.map[json["country_code"]],
        balance: json["balance"].toDouble(),
        cashFlow: json["cash_flow"].toDouble(),
        spendings: json["spendings"].toDouble(),
        earnings: json["earnings"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": nameValues.reverse[name],
        "country_code": countryCodeValues.reverse[countryCode],
        "balance": balance,
        "cash_flow": cashFlow,
        "spendings": spendings,
        "earnings": earnings,
      };
}

enum CountryCode { FR }

final countryCodeValues = EnumValues({"FR": CountryCode.FR});

enum Name {
  CRDIT_AGRICOLE_ILE_DE_FRANCE,
  SOCIT_GNRALE_PARTICULIER,
  AMERICAN_EXPRESS,
  QONTO
}

final nameValues = EnumValues({
  "American Express": Name.AMERICAN_EXPRESS,
  "Crédit Agricole Ile de France": Name.CRDIT_AGRICOLE_ILE_DE_FRANCE,
  "Qonto": Name.QONTO,
  "Société Générale Particulier": Name.SOCIT_GNRALE_PARTICULIER
});

class Links {
  Links({
    this.logoUrl,
  });

  String logoUrl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        logoUrl: json["logo_url"],
      );

  Map<String, dynamic> toJson() => {
        "logo_url": logoUrl,
      };
}

enum DataType { BANK }

final dataTypeValues = EnumValues({"bank": DataType.BANK});

enum StatusCodeInfo { OK }

final statusCodeInfoValues = EnumValues({"OK": StatusCodeInfo.OK});

enum DatumType { BANK_ACCOUNT }

final datumTypeValues = EnumValues({"bank_account": DatumType.BANK_ACCOUNT});

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

import 'dart:convert';

Spendings spendingsFromJson(String str) => Spendings.fromJson(json.decode(str));

String spendingsToJson(Spendings data) => json.encode(data.toJson());

class Spendings {
  Spendings({
    this.data,
  });

  SpendingData data;

  factory Spendings.fromJson(Map<String, dynamic> json) => Spendings(
        data: SpendingData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class SpendingData {
  SpendingData({
    this.id,
    this.type,
    this.attributes,
  });

  String id;
  String type;
  Attributes attributes;

  factory SpendingData.fromJson(Map<String, dynamic> json) => SpendingData(
        id: json["id"],
        type: json["type"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    this.uuid,
    this.name,
    this.siret,
    this.siren,
    this.vatIdentifier,
    this.agaIdentifier,
    this.registrationValidatedAt,
    this.currentVatOption,
    this.currentTaxationRegime,
    this.createdAt,
    this.updatedAt,
    this.balance,
    this.cashFlow,
    this.spendings,
    this.earnings,
    this.financialGrowth,
  });

  String uuid;
  String name;
  String siret;
  String siren;
  String vatIdentifier;
  String agaIdentifier;
  DateTime registrationValidatedAt;
  Current currentVatOption;
  Current currentTaxationRegime;
  DateTime createdAt;
  DateTime updatedAt;
  Map<String, double> balance;
  Map<String, double> cashFlow;
  SpendingsClass spendings;
  Earnings earnings;
  FinancialGrowth financialGrowth;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        uuid: json["uuid"],
        name: json["name"],
        siret: json["siret"],
        siren: json["siren"],
        vatIdentifier: json["vat_identifier"],
        agaIdentifier: json["aga_identifier"],
        registrationValidatedAt:
            DateTime.parse(json["registration_validated_at"]),
        currentVatOption: Current.fromJson(json["current_vat_option"]),
        currentTaxationRegime:
            Current.fromJson(json["current_taxation_regime"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        balance: Map.from(json["balance"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        cashFlow: Map.from(json["cash_flow"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        spendings: SpendingsClass.fromJson(json["spendings"]),
        earnings: Earnings.fromJson(json["earnings"]),
        financialGrowth: FinancialGrowth.fromJson(json["financial_growth"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "siret": siret,
        "siren": siren,
        "vat_identifier": vatIdentifier,
        "aga_identifier": agaIdentifier,
        "registration_validated_at": registrationValidatedAt.toIso8601String(),
        "current_vat_option": currentVatOption.toJson(),
        "current_taxation_regime": currentTaxationRegime.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "balance":
            Map.from(balance).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "cash_flow":
            Map.from(cashFlow).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "spendings": spendings.toJson(),
        "earnings": earnings.toJson(),
        "financial_growth": financialGrowth.toJson(),
      };
}

class Current {
  Current({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.uuid,
  });

  int id;
  String code;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String uuid;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "uuid": uuid,
      };
}

class Earnings {
  Earnings({
    this.cotisationsSocialesDeVosSalaris,
    this.recettes,
    this.immobilisation,
  });

  Map<String, double> cotisationsSocialesDeVosSalaris;
  Map<String, double> recettes;
  Map<String, double> immobilisation;

  factory Earnings.fromJson(Map<String, dynamic> json) => Earnings(
        cotisationsSocialesDeVosSalaris:
            Map.from(json["Cotisations sociales de vos salariés"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        recettes: Map.from(json["Recettes"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        immobilisation: Map.from(json["Immobilisation"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "Cotisations sociales de vos salariés":
            Map.from(cotisationsSocialesDeVosSalaris)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Recettes":
            Map.from(recettes).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Immobilisation": Map.from(immobilisation)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class FinancialGrowth {
  FinancialGrowth({
    this.value,
    this.percentage,
  });

  double value;
  double percentage;

  factory FinancialGrowth.fromJson(Map<String, dynamic> json) =>
      FinancialGrowth(
        value: json["value"].toDouble(),
        percentage: json["percentage"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "percentage": percentage,
      };
}

class SpendingsClass {
  SpendingsClass({
    this.immobilisation,
    this.virementCompteCompte,
    this.petitOutillage,
    this.documentation,
    this.restaurant,
  });

  Map<String, double> immobilisation;
  Map<String, double> virementCompteCompte;
  Map<String, double> petitOutillage;
  Map<String, double> documentation;
  Map<String, double> restaurant;

  factory SpendingsClass.fromJson(Map<String, dynamic> json) => SpendingsClass(
        immobilisation: Map.from(json["Immobilisation"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        virementCompteCompte: Map.from(json["Virement compte à compte"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        petitOutillage: Map.from(json["Petit Outillage"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        documentation: Map.from(json["Documentation"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        restaurant: Map.from(json["Restaurant"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "Immobilisation": Map.from(immobilisation)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Virement compte à compte": Map.from(virementCompteCompte)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Petit Outillage": Map.from(petitOutillage)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Documentation": Map.from(documentation)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Restaurant":
            Map.from(restaurant).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

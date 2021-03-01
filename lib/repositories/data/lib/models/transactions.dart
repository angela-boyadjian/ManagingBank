import 'dart:convert';

Transactions transactionsFromJson(String str) =>
    Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
  Transactions({
    this.data,
  });

  List<Transaction> data;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        data: List<Transaction>.from(
            json["data"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Transaction {
  Transaction({
    this.id,
    this.type,
    this.attributes,
  });

  String id;
  String type;
  TransactionAttributes attributes;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        type: json["type"],
        attributes: TransactionAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
      };
}

class TransactionAttributes {
  TransactionAttributes({
    this.id,
    this.uuid,
    this.bankAccountId,
    this.description,
    this.rawDescription,
    this.externalId,
    this.amount,
    this.date,
    this.currencyCode,
    this.isDeleted,
    this.isFuture,
    this.hasAttachments,
    this.comment,
    this.operationType,
    this.locked,
    this.hasAssets,
    this.transactionCategories,
    this.documents,
  });

  int id;
  String uuid;
  int bankAccountId;
  String description;
  String rawDescription;
  String externalId;
  String amount;
  DateTime date;
  String currencyCode;
  bool isDeleted;
  bool isFuture;
  bool hasAttachments;
  dynamic comment;
  String operationType;
  bool locked;
  bool hasAssets;
  TransactionCategories transactionCategories;
  Transaction documents;

  factory TransactionAttributes.fromJson(Map<String, dynamic> json) =>
      TransactionAttributes(
        id: json == null ? null : json["id"],
        uuid: json == null ? null : json["uuid"],
        bankAccountId: json == null ? null : json["bank_account_id"],
        description: json == null ? null : json["description"],
        rawDescription: json == null ? null : json["raw_description"],
        externalId: json == null ? null : json["external_id"],
        amount: json == null ? null : json["amount"],
        date: json == null ? null : DateTime.parse(json["date"]),
        currencyCode: json == null ? null : json["currency_code"],
        isDeleted: json == null ? null : json["is_deleted"],
        isFuture: json == null ? null : json["is_future"],
        hasAttachments: json == null ? null : json["has_attachments"],
        comment: json == null ? null : json["comment"],
        operationType: json == null ? null : json["operation_type"],
        locked: json == null ? null : json["locked"],
        hasAssets: json == null
            ? null
            : json["has_assets"] == null
                ? null
                : json["has_assets"],
        transactionCategories: json == null
            ? null
            : TransactionCategories.fromJson(json["transaction_categories"]),
        documents:
            json == null ? null : Transaction.fromJson(json["documents"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "bank_account_id": bankAccountId,
        "description": description,
        "raw_description": rawDescription,
        "external_id": externalId,
        "amount": amount,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "currency_code": currencyCode,
        "is_deleted": isDeleted,
        "is_future": isFuture,
        "has_attachments": hasAttachments,
        "comment": comment,
        "operation_type": operationType,
        "locked": locked,
        "has_assets": hasAssets == null ? null : hasAssets,
        "transaction_categories": transactionCategories.toJson(),
        "documents": documents.toJson(),
      };
}

class TransactionCategories {
  TransactionCategories({
    this.data,
  });

  List<TransactionCategoriesDatum> data;

  factory TransactionCategories.fromJson(Map<String, dynamic> json) =>
      TransactionCategories(
        data: List<TransactionCategoriesDatum>.from(
            json["data"].map((x) => TransactionCategoriesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TransactionCategoriesDatum {
  TransactionCategoriesDatum({
    this.id,
    this.type,
    this.attributes,
  });

  String id;
  Type type;
  CategoryAttributes attributes;

  factory TransactionCategoriesDatum.fromJson(Map<String, dynamic> json) =>
      TransactionCategoriesDatum(
        id: json["id"],
        type: typeValues.map[json["type"]],
        attributes: CategoryAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "attributes": attributes.toJson(),
      };
}

class CategoryAttributes {
  CategoryAttributes({
    this.uuid,
    this.kind,
    this.amount,
    this.transactionId,
    this.internalCategoryUuid,
    this.externalCategoryId,
    this.vatRateUuid,
    this.vatExemptExplanationUuid,
  });

  String uuid;
  String kind;
  String amount;
  int transactionId;
  String internalCategoryUuid;
  int externalCategoryId;
  String vatRateUuid;
  String vatExemptExplanationUuid;

  factory CategoryAttributes.fromJson(Map<String, dynamic> json) =>
      CategoryAttributes(
        uuid: json["uuid"],
        kind: json["kind"] == null ? null : json["kind"],
        amount: json["amount"] == null ? null : json["amount"],
        transactionId: json["transaction_id"],
        internalCategoryUuid: json["internal_category_uuid"] == null
            ? null
            : json["internal_category_uuid"],
        externalCategoryId: json["external_category_id"] == null
            ? null
            : json["external_category_id"],
        vatRateUuid:
            json["vat_rate_uuid"] == null ? null : json["vat_rate_uuid"],
        vatExemptExplanationUuid: json["vat_exempt_explanation_uuid"] == null
            ? null
            : json["vat_exempt_explanation_uuid"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "kind": kind == null ? null : kind,
        "amount": amount == null ? null : amount,
        "transaction_id": transactionId,
        "internal_category_uuid":
            internalCategoryUuid == null ? null : internalCategoryUuid,
        "external_category_id":
            externalCategoryId == null ? null : externalCategoryId,
        "vat_rate_uuid": vatRateUuid == null ? null : vatRateUuid,
        "vat_exempt_explanation_uuid":
            vatExemptExplanationUuid == null ? null : vatExemptExplanationUuid,
      };
}

enum Type { TRANSACTION_CATEGORY }

final typeValues =
    EnumValuesTransaction({"transaction_category": Type.TRANSACTION_CATEGORY});

class EnumValuesTransaction<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValuesTransaction(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

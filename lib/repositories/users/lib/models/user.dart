import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:users/models/exercise.dart';
import 'package:users/models/vat_exempt.dart';
import 'package:users/models/vat_rates.dart';
import 'package:users/models/categories.dart';
import 'package:users/models/organization.dart';

class User extends Equatable {
  final String uuid;
  final String firstname;
  final String lastname;
  final String email;
  final Organization organization;
  final List<VatRates> vatRates;
  final List<VatExempt> vatExempt;
  final List<Exercise> exercises;
  final Categories categories;
  final Map<String, String> header;

  const User(
      this.uuid,
      this.firstname,
      this.lastname,
      this.email,
      this.organization,
      this.vatRates,
      this.vatExempt,
      this.exercises,
      this.categories,
      {this.header});

  Map<String, Object> toJson() {
    return {
      'uuid': uuid,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'organization': organization.toJson(),
      'vat_rates': jsonEncode(vatRates),
      'vat_exempt': jsonEncode(vatExempt),
      'exercises': jsonEncode(exercises),
      'categories': categoriesToJson(categories),
    };
  }

  static User fromJson(Map<String, Object> json) {
    var vatList = json['vat_rates'] as List;
    List<VatRates> vatFinalList =
        vatList.map((i) => VatRates.fromJson(i)).toList();
    var vatExemptList = json['vat_exempt'] as List;
    List<VatExempt> vatExemptFinalList =
        vatExemptList.map((i) => VatExempt.fromJson(i)).toList();
    var exerciseList = json['exercises'] as List;
    List<Exercise> exerciseFinalList =
        exerciseList.map((i) => Exercise.fromJson(i)).toList();

    return User(
      json['uuid'] as String,
      json['firstname'] as String,
      json['lastname'] as String,
      json['email'] as String,
      json['organization'] as Organization,
      vatFinalList,
      vatExemptFinalList,
      exerciseFinalList,
      categoriesFromJson(json['categories']),
    );
  }

  List<Object> get props => [
        this.uuid,
        this.firstname,
        this.lastname,
        this.email,
        this.organization,
        this.vatRates,
        this.vatExempt,
        this.exercises,
        this.categories,
        this.header,
      ];
}

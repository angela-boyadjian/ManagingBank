import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:users/models/organization.dart';

import 'package:users/models/user.dart';
import 'package:users/models/vat_exempt.dart';
import 'package:users/models/vat_rates.dart';
import 'package:users/models/categories.dart';
import 'package:users/providers/provider.dart';

class APIProvider extends AProvider {
  final String _url = "https://api.mimi.neatops.tech";

  @override
  Future<void> addUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(User user) {
    throw UnimplementedError();
  }

  _getApiCall(String url, Map<String, String> header) async {
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode != 200) throw Exception();

    return (response.body);
  }

  @override
  Future<User> getUser(String id) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(id);
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $id'
    };

    //Get User
    var userDecoded = jsonDecode(await _getApiCall(
        "$_url/api/v1/users/${decodedToken['user']['uuid']}", header));
    var data = userDecoded['data']['attributes'];

    //Get Org => Find a way to check if org is null
    Organization userOrg = Organization(
        decodedToken['organizations'][0]['uuid'],
        decodedToken['organizations'][0]['name']);

    //Get VAT
    var vatRatesDecoded =
        jsonDecode(await _getApiCall("$_url/api/v1/vat_rates", header));
    List<dynamic> vatRatesList = vatRatesDecoded['data'];
    List<VatRates> vatRatesListFinal = [];
    vatRatesList.forEach((element) {
      vatRatesListFinal.add(VatRates.fromJson(element['attributes']));
    });

    //Get Exempt
    var vatExemptDecoded = jsonDecode(
        await _getApiCall("$_url/api/v1/vat_exempt_explanations", header));
    List<dynamic> vatExemptList = vatExemptDecoded['data'];
    List<VatExempt> vatExemptListFinal = [];
    vatExemptList.forEach((element) {
      vatExemptListFinal.add(VatExempt.fromJson(element['attributes']));
    });

    //Get exercises

    //Get Categories
    Categories categories = categoriesFromJson(
        await _getApiCall("$_url/api/v1/categories", header));

    print(categories.data.length);

    return User(
        decodedToken['user']['uuid'],
        data['firstname'],
        data['lastname'],
        data['email'],
        userOrg,
        vatRatesListFinal,
        vatExemptListFinal,
        null,
        categories);
  }

  @override
  Future<void> updateUser(User user) {
    throw UnimplementedError();
  }
}

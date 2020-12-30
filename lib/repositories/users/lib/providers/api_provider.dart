import 'dart:io';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

import 'package:users/models/user.dart';
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

  @override
  Future<User> getUser(String id) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(id);
    print('TOKEN: ' + id);
    http.Response response = await http.get(
      "$_url/api/v1/users/${decodedToken['user']['uuid']}",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $id',
      },
    );
    print('CODE: ${response.statusCode}');
    print('RESPONSE: ${response.body}');
    http.Response r = await http.get(
      "$_url/api/v1/organizations/${decodedToken['user']['uuid']}",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $id',
      },
    );
    print('CODE2: ${r.statusCode}');
    print('RESPONSE2: ${r.body}');
     http.Response r2 = await http.get(
      "$_url/api/v1/vat_rates/?${decodedToken['user']['uuid']}",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $id',
      },
    );
    print('CODE2: ${r.statusCode}');
    print('RESPONSE2: ${r.body}');
    print(decodedToken);
    print('USER ${decodedToken['user']['uuid']}');
  }

  @override
  Future<void> updateUser(User user) {
    throw UnimplementedError();
  }
}

import 'dart:convert';

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

    http.Response response = await http.get(
      "$_url/api/v1/users/${decodedToken['user']['uuid']}",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $id',
      },
    );
    if (response.statusCode != 200) throw Exception();

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    var data = jsonData['data']['attributes'];

    return User(decodedToken['user']['uuid'], data['firstname'],
        data['lastname'], data['email'], null, null, null, null);
  }

  @override
  Future<void> updateUser(User user) {
    throw UnimplementedError();
  }
}

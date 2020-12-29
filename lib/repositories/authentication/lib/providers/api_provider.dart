import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:authentication/models/user.dart';
import 'package:authentication/providers/provider.dart';

// FIXME CLOSE STREAM OMG
class APIProvider extends AProvider {
  final String _url = "https://api.mimi.neatops.tech";
  StreamController<User> _user = StreamController<User>();

  APIProvider() {
    _user.add(User.empty);
  }

  @override
  Future<void> changeEmail({String email}) {
    throw UnimplementedError();
  }

  @override
  Future<void> changePassword({String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> logInWithEmailAndPassword(
      {String email, String password}) async {
    final String finalUrl = _url + "/api/v1/login";

    http.Response response = await http.post(finalUrl,
        body: {'email': email, 'password': password, 'grant_type': 'password'});

    if (response.statusCode != 200) throw Exception();
    print('LOGIN SUCCESS');

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    _user.add(User(id: jsonData['access_token'], email: email));
  }

  @override
  Future<void> logInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({String email, String password}) {
    throw UnimplementedError();
  }

  @override
  Stream<User> get user {
    return _user.stream;
  }
}

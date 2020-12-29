import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:users/models/user.dart';
import 'package:users/providers/provider.dart';

class APIProvider extends AProvider {
  @override
  Future<void> addUser(User user) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(User user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(String id) {
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(id);
    print(decodedToken);
    print('USER ${decodedToken['user']['uuid']}');
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}

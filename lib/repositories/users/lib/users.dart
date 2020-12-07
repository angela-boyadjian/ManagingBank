
import 'models/user.dart';
import 'providers/api_provider.dart';

class UsersRepository {
  APIProvider _provider = APIProvider();

  Future<User> getUser(String id) async => await _provider.getUser(id);

  Future<void> addUser(User user) async => await _provider.addUser(user);

  Future<void> deleteUser(User user) async => await _provider.deleteUser(user);

  Future<void> updateUser(User user) async => await _provider.updateUser(user);
}
import 'package:authentication/models/user.dart';
import 'package:authentication/providers/provider.dart';

class APIProvider extends AProvider {
  @override
  Future<void> changeEmail({String email}) {
      throw UnimplementedError();
    }

    @override
    Future<void> changePassword({String password}) {
      throw UnimplementedError();
    }

    @override
    Future<void> logInWithEmailAndPassword({String email, String password}) {
      throw UnimplementedError();
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
  Stream<User> get user async* {
    yield User.empty;
  }

}
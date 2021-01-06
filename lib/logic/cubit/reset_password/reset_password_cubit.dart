import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final String _url = "https://api.mimi.neatops.tech/api/v1/otp_tokens";

  ResetPasswordCubit() : super(ResetPasswordInitial());

  void resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      var response = await http.Client().post(_url, body: {'email': email});
      if (response.statusCode != 200) {
        emit(ResetPasswordError());
      } else {
        emit(ResetPasswordSuccess());
      }
    } on Exception {}
  }
}

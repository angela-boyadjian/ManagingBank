import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:data/data_repository.dart';

part 'bank_account_state.dart';

class BankAccountCubit extends Cubit<BankAccountState> {
  final DataRepository _dataRepository;
  final String _uuid;
  final Map<String, String> _header;
  BankAccount _bankAccounts;

  BankAccountCubit(this._dataRepository, this._uuid, this._header)
      : super(BankAccountInitial()) {
    _getBankAccounts();
  }

  String _getTotal() {
    return "123";
  }

  Future<void> _getBankAccounts() async {
    emit(BankAccountInProgress());
    _bankAccounts =
        await _dataRepository.getBankAccountByUser(this._uuid, this._header);
    emit(BankAccountSuccess(amount: _getTotal()));
  }
}

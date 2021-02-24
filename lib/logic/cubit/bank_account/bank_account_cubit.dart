import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:data/data_repository.dart';
import 'package:intl/intl.dart';

part 'bank_account_state.dart';

class BankAccountCubit extends Cubit<BankAccountState> {
  final DataRepository _dataRepository;
  final String _uuid;
  final Map<String, String> _header;
  BankAccount _bankAccounts;
  List<DatumAttributes> _banks = [];

  BankAccountCubit(this._dataRepository, this._uuid, this._header)
      : super(BankAccountInitial()) {
    _getBankAccounts();
  }

  String _getTotal() {
    double result = 0.0;
    var f = new NumberFormat("###,000.0#", "fr");
    _banks.forEach((element) {
      result += element.balance.toDouble();
    });
    return f.format(result).toString();
  }

  Future<void> _getBankAccounts() async {
    emit(BankAccountInProgress());
    _bankAccounts =
        await _dataRepository.getBankAccountByUser(this._uuid, this._header);
    _bankAccounts.data.forEach((element) {
      if (element.attributes.enabled == true) {
        _banks.add(element.attributes);
      }
    });
    emit(BankAccountSuccess(banks: _banks, amount: _getTotal()));
  }
}

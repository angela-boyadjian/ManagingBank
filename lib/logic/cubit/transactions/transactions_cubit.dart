import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:data/data_repository.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final DataRepository _dataRepository;
  final String _uuid;
  final Map<String, String> _header;
  List<Transaction> _transactions;
  int page;

  TransactionsCubit(this._dataRepository, this._uuid, this._header)
      : page = 1,
        super(TransactionsInitial()) {
    getTransactions();
  }

  void _printAttributes(TransactionAttributes attributes) {
    print('ID: ${attributes.id}');
    print('UUID: ${attributes.uuid}');
    print('BANKACCOUNTID: ${attributes.bankAccountId}');
    print('DESCRIPTION: ${attributes.description}');
    print('AMOUNT: ${attributes.amount}');
  }

  Future<void> getTransactions() async {
    emit(TransactionsInProgress());
    var transactionsData =
        await _dataRepository.getTransactions(this._uuid, this._header, page);
    _transactions = transactionsData.data;
    page += 1;
    emit(TransactionsSuccess(transactions: _transactions));
  }
}

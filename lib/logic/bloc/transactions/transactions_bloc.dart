import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/data_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:mimi/constants/constants.dart' as constants;

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final DataRepository _dataRepository;
  final String _uuid;
  final Map<String, String> _header;

  TransactionsBloc(this._dataRepository, this._uuid, this._header)
      : super(TransactionsInitial());

  @override
  Stream<TransactionsState> mapEventToState(
    TransactionsEvent event,
  ) async* {
    final currentState = state;
    if (event is TransactionsFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is TransactionsInitial) {
          final transactions = await _fetchTransactions(1);
          yield TransactionsSuccess(
              transactions: transactions, hasReachedMax: false);
          return;
        }
        if (currentState is TransactionsSuccess) {
          final transactions = await _fetchTransactions(
              currentState.transactions.length ~/ constants.perPage + 1);
          yield TransactionsSuccess(
            transactions: currentState.transactions + transactions,
            hasReachedMax: false,
          );
        }
      } catch (_) {
        yield TransactionsFailure();
      }
    }
  }

  bool _hasReachedMax(TransactionsState state) =>
      state is TransactionsSuccess && state.hasReachedMax;

  Future<List<Transaction>> _fetchTransactions(int page) async {
    try {
      var transactionsData =
          await _dataRepository.getTransactions(this._uuid, this._header, page);
      return transactionsData.data;
    } on Exception {
      throw Exception();
    }
  }
}

part of 'transactions_cubit.dart';

abstract class TransactionsState extends Equatable {
  final List<Transaction> transactions;

  const TransactionsState({this.transactions});

  @override
  List<Object> get props => [this.transactions];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsInProgress extends TransactionsState {}

class TransactionsSuccess extends TransactionsState {
  final List<Transaction> transactions;

  const TransactionsSuccess({this.transactions});
  @override
  List<Object> get props => [this.transactions];
}

class TransactionsError extends TransactionsState {}

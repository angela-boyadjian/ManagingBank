part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsFailure extends TransactionsState {}

class TransactionsSuccess extends TransactionsState {
  final List<Transaction> transactions;
  final bool hasReachedMax;

  const TransactionsSuccess({this.transactions, this.hasReachedMax});

  TransactionsSuccess copyWith(
      {List<Transaction> transaction, bool hasReachedMax}) {
    return TransactionsSuccess(
      transactions: transactions ?? this.transactions,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [this.transactions, this.hasReachedMax];
}

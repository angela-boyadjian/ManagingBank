part of 'bank_account_cubit.dart';

abstract class BankAccountState extends Equatable {
  const BankAccountState();

  @override
  List<Object> get props => [];
}

class BankAccountInitial extends BankAccountState {}

class BankAccountInProgress extends BankAccountState {}

class BankAccountSuccess extends BankAccountState {
  final String amount;

  const BankAccountSuccess({this.amount});
  @override
  List<Object> get props => [];
}

class BankAccountError extends BankAccountState {}

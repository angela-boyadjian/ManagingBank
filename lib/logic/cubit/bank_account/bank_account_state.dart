part of 'bank_account_cubit.dart';

abstract class BankAccountState extends Equatable {
  final String amount;
  final List<DatumAttributes> banks;

  const BankAccountState({this.banks, this.amount});

  @override
  List<Object> get props => [this.amount, this.banks];
}

class BankAccountInitial extends BankAccountState {}

class BankAccountInProgress extends BankAccountState {}

class BankAccountSuccess extends BankAccountState {
  final String amount;
  final List<DatumAttributes> banks;

  const BankAccountSuccess({this.banks, this.amount});
  @override
  List<Object> get props => [this.amount, this.banks];
}

class BankAccountError extends BankAccountState {}

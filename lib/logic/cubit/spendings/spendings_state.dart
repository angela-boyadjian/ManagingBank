part of 'spendings_cubit.dart';

abstract class SpendingsState extends Equatable {
  const SpendingsState();

  @override
  List<Object> get props => [];
}

class SpendingsInitial extends SpendingsState {}

class SpendingsLoading extends SpendingsState {}

class SpendingsError extends SpendingsState {}

class SpendingsSuccess extends SpendingsState {
  final Spendings spendings;

  const SpendingsSuccess({this.spendings});

  @override
  List<Object> get props => [this.spendings];
}

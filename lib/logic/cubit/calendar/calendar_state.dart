part of 'calendar_cubit.dart';

class CalendarState extends Equatable {
  final bool isOpen;
  final DatePeriod selectedPeriod;
  final bool firstUse;

  const CalendarState(this.isOpen, this.selectedPeriod, this.firstUse);

  @override
  List<Object> get props => [this.isOpen, this.selectedPeriod];
}

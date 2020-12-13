import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(CalendarState(
            false, DatePeriod(DateTime.now(), DateTime.now()), true));

  void tapOnBar() {
    emit(CalendarState(!state.isOpen, state.selectedPeriod, state.firstUse));
  }

  void selectPeriod(DatePeriod selectedPeriod) {
    emit(CalendarState(state.isOpen, selectedPeriod, false));
  }
}

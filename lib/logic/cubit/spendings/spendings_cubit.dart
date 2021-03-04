import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:data/data_repository.dart';

part 'spendings_state.dart';

class SpendingsCubit extends Cubit<SpendingsState> {
  final DataRepository _dataRepository;
  final String _uuid;
  final Map<String, String> _header;
  final String _orgUuid;

  SpendingsCubit(this._dataRepository, this._uuid, this._header, this._orgUuid)
      : super(SpendingsInitial()) {
    fetchSpendings("month");
  }

  Future<void> fetchSpendings(String period) async {
    try {
      emit(SpendingsLoading());
      var spendings =
          await _dataRepository.getSpendings(_uuid, _header, _orgUuid, period);
      emit(SpendingsSuccess(spendings: spendings));
    } on Exception {
      emit(SpendingsError());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';

part 'drop_down_state.dart';

class DropDownCubit extends Cubit<DropDownState> {
  List<DropDownModel> _items;
  bool _isOpen = false;
  int selectedIndex;

  DropDownCubit(this._items, this.selectedIndex)
      : super(DropDownState(_items, false, selectedIndex));

  void tapOnBar() {
    _isOpen = !_isOpen;
    emit(DropDownState(_items, _isOpen, selectedIndex));
  }

  void tapOnItem(int index) {
    _items[index].selected = true;
    _items[selectedIndex].selected = false;
    selectedIndex = index;
    _isOpen = false;
    emit(DropDownState(_items, _isOpen, selectedIndex));
  }
}

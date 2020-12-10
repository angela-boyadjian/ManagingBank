part of 'drop_down_cubit.dart';

class DropDownState extends Equatable {
  final List<DropDownModel> items;
  final bool isOpen;
  final selectedIndex;

  const DropDownState(this.items, this.isOpen, this.selectedIndex);

  @override
  List<Object> get props => [this.items, this.isOpen, this.selectedIndex];
}

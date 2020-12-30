import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/logic/cubit/cubit.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({Key key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  Widget _buildBar(state) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            color: Color(0xFFA9A9EF),
            width: 1.5,
          ),
          color: Colors.white),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: 40.0,
        onPressed: () => BlocProvider.of<DropDownCubit>(context).tapOnBar(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(state.items[state.selectedIndex].text,
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Icon(
              FontAwesomeIcons.caretDown,
              color: Color(0xFFA9A9EF),
              size: 14.0,
            )
          ],
        ),
      ),
    );
  }

  double _maxScrollSize(double itemHeight, double lenght) {
    double size = lenght * itemHeight;
    return MediaQuery.of(context).size.height / 2 < size
        ? itemHeight * 5
        : size;
  }

  Widget _buildListMenu(state) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
        height: state.isOpen
            ? _maxScrollSize(60.0, state.items.length.toDouble())
            : 0,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 5.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return ListTile(
                title: Text(state.items[index].text,
                    style: Theme.of(ctxt).textTheme.subtitle1),
                trailing: state.selectedIndex == index
                    ? Icon(FontAwesomeIcons.check,
                        color: Color(0xFF48D73C), size: 10.0)
                    : null,
                onTap: () =>
                    BlocProvider.of<DropDownCubit>(ctxt).tapOnItem(index),
                selected: state.items[index].selected,
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownCubit, DropDownState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildBar(state),
            SizedBox(height: 10.0),
            _buildListMenu(state),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatePicker extends StatefulWidget {
  DatePicker({Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  Widget _buildBar() {
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
        onPressed: () => {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.calendar,
              color: Color(0xFFA9A9EF),
              size: 14.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Selectionnez une date ou période",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF242461).withOpacity(0.25))),
            ),
            Icon(
              FontAwesomeIcons.caretDown,
              color: Color(0xFFA9A9EF),
              size: 14.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBar(),
      ],
    );
  }
}

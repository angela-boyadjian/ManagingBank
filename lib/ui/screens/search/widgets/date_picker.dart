import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatePicker extends StatefulWidget {
  DatePicker({Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _firstDate;
  DateTime _lastDate;
  DatePeriod _selectedPeriod;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();

    _firstDate = DateTime.now().subtract(Duration(days: 345));
    _lastDate = DateTime.now().add(Duration(days: 345));

    DateTime selectedPeriodStart = DateTime.now().subtract(Duration(days: 4));
    DateTime selectedPeriodEnd = DateTime.now().add(Duration(days: 8));
    _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
  }

  _showDatePicker() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  void _onSelectedDateChanged(DatePeriod newPeriod) {
    setState(() {
      _selectedPeriod = newPeriod;
    });
  }

  Widget _buildBar() {
    return Column(
      children: [
        Container(
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
            onPressed: () => _showDatePicker(),
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
        ),
        SizedBox(height: 10.0),
        AnimatedContainer(
          height: _isOpen ? 315 : 0,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeIn,
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
          child: SingleChildScrollView(
            child: RangePicker(
              datePickerLayoutSettings: DatePickerLayoutSettings(
                  showPrevMonthEnd: true, showNextMonthStart: true),
              selectedPeriod: _selectedPeriod,
              onChanged: _onSelectedDateChanged,
              firstDate: _firstDate,
              lastDate: _lastDate,
              datePickerStyles: DatePickerRangeStyles(
                currentDateStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                selectedDateStyle: TextStyle(color: Colors.white),
                // TODO Get correct color from theme
                selectedPeriodMiddleTextStyle:
                    TextStyle(color: Color(0xFF242461)),
                selectedSingleDateDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                displayedPeriodTitle: TextStyle(fontWeight: FontWeight.bold),
                selectedPeriodStartTextStyle: TextStyle(color: Colors.white),
                selectedPeriodEndTextStyle: TextStyle(color: Colors.white),
                selectedPeriodLastDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                selectedPeriodStartDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                selectedPeriodMiddleDecoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    shape: BoxShape.rectangle),
                nextIcon: Icon(Icons.arrow_forward,
                    color: Theme.of(context).unselectedWidgetColor),
                prevIcon: Icon(Icons.arrow_back,
                    color: Theme.of(context).unselectedWidgetColor),
              ),
            ),
          ),
        ),
      ],
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

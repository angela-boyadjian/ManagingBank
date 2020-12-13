import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimi/logic/cubit/calendar/calendar_cubit.dart';

class DatePicker extends StatefulWidget {
  DatePicker({Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _firstDate;
  DateTime _lastDate;

  @override
  void initState() {
    super.initState();

    _firstDate = DateTime.now().subtract(Duration(days: 345));
    _lastDate = DateTime.now().add(Duration(days: 345));
  }

  String _dateTimeToEUString(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  String _datePeriodToString(DatePeriod datePeriod) {
    if (datePeriod.start.day == datePeriod.end.day &&
        datePeriod.start.month == datePeriod.end.month &&
        datePeriod.start.year == datePeriod.end.year)
      return "Le ${_dateTimeToEUString(datePeriod.start)}";
    return "Du ${_dateTimeToEUString(datePeriod.start)} au ${_dateTimeToEUString(datePeriod.end)}";
  }

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
        onPressed: () => BlocProvider.of<CalendarCubit>(context).tapOnBar(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.calendar,
              color: Color(0xFFA9A9EF),
              size: 14.0,
            ),
            BlocBuilder<CalendarCubit, CalendarState>(
              builder: (context, state) {
                if (state.firstUse) {
                  return Text("Selectionnez une date ou période",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF242461).withOpacity(0.25)));
                } else {
                  return Text(_datePeriodToString(state.selectedPeriod),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ));
                }
              },
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

  Widget _buildCalendar() {
    DecorationImage circleImg = DecorationImage(
        image: AssetImage("assets/images/calendar_bg.png"),
        fit: BoxFit.contain);

    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        return AnimatedContainer(
          height:
              BlocProvider.of<CalendarCubit>(context).state.isOpen ? 315 : 0,
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
                  maxDayPickerRowCount: 5,
                  showPrevMonthEnd: true,
                  showNextMonthStart: true),
              selectedPeriod:
                  BlocProvider.of<CalendarCubit>(context).state.selectedPeriod,
              onChanged: BlocProvider.of<CalendarCubit>(context).selectPeriod,
              firstDate: _firstDate,
              lastDate: _lastDate,
              datePickerStyles: DatePickerRangeStyles(
                dayHeaderStyleBuilder: (int dayOfTheWeek) => DayHeaderStyle(
                  textStyle: TextStyle(color: Color(0xFFCBCBF6)),
                ),
                currentDateStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                selectedDateStyle: TextStyle(color: Colors.white),
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
                    color: Theme.of(context).highlightColor,
                    image: circleImg,
                    gradient: LinearGradient(colors: [
                      Theme.of(context).highlightColor,
                      Colors.transparent
                    ], stops: [
                      0.5,
                      0.5
                    ]),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(23.0),
                        bottomRight: Radius.circular(23.0))),
                selectedPeriodStartDecoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    image: circleImg,
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      Theme.of(context).highlightColor,
                    ], stops: [
                      0.5,
                      0.5
                    ]),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(23.0),
                        bottomLeft: Radius.circular(23.0))),
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
        );
      },
    );
  }

  Widget _buildContainer() {
    return Column(
      children: [_buildBar(), SizedBox(height: 10.0), _buildCalendar()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildContainer(),
      ],
    );
  }
}

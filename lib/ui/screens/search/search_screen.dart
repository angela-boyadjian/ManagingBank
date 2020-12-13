import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:mimi/logic/cubit/calendar/calendar_cubit.dart';

import 'package:mimi/ui/widgets/custom_button.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/constants/constants.dart' as constants;

import 'widgets/date_picker.dart';
import 'widgets/search_card.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> items = [
    "Encaissements",
    "Frais de Déplacements, Missions, Réceptions",
    "Frais Fixes",
    "Frais de Fonctionnement",
    "Rémunérations et Cotisations Sociales",
    'Taxes et Impôts',
  ];
  double _lowerValue = constants.min;
  double _upperValue = 1000.0;

  Widget _buildSlider() {
    return FlutterSlider(
      values: [_lowerValue, _upperValue],
      rangeSlider: true,
      max: constants.max,
      min: constants.min,
      handler: FlutterSliderHandler(
        decoration: BoxDecoration(),
        child: Material(
          elevation: 2,
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
          child: Container(height: 20.0, width: 20.0),
        ),
      ),
      rightHandler: FlutterSliderHandler(
        decoration: BoxDecoration(),
        child: Material(
          elevation: 2,
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
          child: Container(height: 20.0, width: 20.0),
        ),
      ),
      trackBar: FlutterSliderTrackBar(
        activeTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).primaryColor,
        ),
        inactiveTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        inactiveTrackBarHeight: 8.0,
        activeTrackBarHeight: 8.0,
      ),
      onDragging: (handlerIndex, lowerValue, upperValue) {
        setState(() {
          _lowerValue = lowerValue;
          _upperValue = upperValue;
        });
      },
      tooltip: FlutterSliderTooltip(
          positionOffset: FlutterSliderTooltipPositionOffset(top: 20.0),
          format: (String value) {
            return value.substring(0, value.indexOf('.')) + ' € ';
          }),
    );
  }

  Widget _buildText() {
    String upperValue = _upperValue.toInt().toString();

    if (_upperValue == constants.max) upperValue = "Max";
    return Text(
      "${_lowerValue.toInt()} € - $upperValue €",
      style: Theme.of(context).textTheme.subtitle2.copyWith(
            color: Color(0xFF242461).withOpacity(0.6),
            fontSize: 12.0,
          ),
    );
  }

  Widget _buildList() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (context, index) {
          return SearchCard(title: items[index]);
        },
        separatorBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 0.88,
            color: Color(0xFFEEEEFC),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Recherche", cancel: true),
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(flex: 1),
              Flexible(
                flex: 4,
                child: _buildList(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.88,
                color: Color(0xFFEEEEFC),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: _buildSlider(),
                    ),
                  ],
                ),
              ),
              Center(child: CustomButton(onPressed: () {}, text: "Filtrer")),
              Spacer(flex: 1),
            ],
          ),
          Positioned(
            bottom: 165,
            left: 30,
            child: _buildText(),
          ),
          Positioned(
            top: 20,
            right: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.96,
            child: BlocProvider<CalendarCubit>(
              create: (context) => CalendarCubit(),
              child: DatePicker(),
            ),
          ),
        ],
      ),
    );
  }
}

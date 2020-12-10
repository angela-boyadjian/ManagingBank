import 'package:flutter/material.dart';

import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/drop_down/custom_drop_down.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';

class ResultsScreen extends StatefulWidget {
  ResultsScreen({Key key}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final List<DropDownModel> items = [
    DropDownModel(text: "Ce mois", selected: true),
    DropDownModel(text: "Ce trimestre", selected: false),
    DropDownModel(text: "Cette année"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Résultats"),
      body: Column(
        children: [
          SizedBox(height: 30.0),
          Flexible(
            flex: 0,
            child: Center(child: CustomDropDown(items: items, selectIndex: 0)),
          ),
          Spacer(flex: 2),
          Spacer(flex: 2),
          Spacer(flex: 2),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class FavouriteFoodModel {
  final String foodName;
  final double calories;
  FavouriteFoodModel({
    this.foodName,
    this.calories,
  });
}

import 'package:flutter/material.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/custom_drop_down.dart';

class ResultsScreen extends StatefulWidget {
  ResultsScreen({Key key}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final List<FavouriteFoodModel> _favouriteFoodModelList = [
    FavouriteFoodModel(foodName: 'Ce mois', calories: 161),
    FavouriteFoodModel(foodName: 'Ce trimestre', calories: 220),
    FavouriteFoodModel(foodName: 'Cette année', calories: 208),
  ];
  FavouriteFoodModel _favouriteFoodModel = FavouriteFoodModel();
  List<DropdownMenuItem<FavouriteFoodModel>> _favouriteFoodModelDropdownList;

  @override
  void initState() {
    _favouriteFoodModelDropdownList =
        _buildFavouriteFoodModelDropdown(_favouriteFoodModelList);
    _favouriteFoodModel = _favouriteFoodModelList[0];
    super.initState();
  }

  List<DropdownMenuItem<FavouriteFoodModel>> _buildFavouriteFoodModelDropdown(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<FavouriteFoodModel>> items = List();
    for (FavouriteFoodModel favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(favouriteFoodModel.foodName),
      ));
    }
    return items;
  }

  _onChangeFavouriteFoodModelDropdown(FavouriteFoodModel favouriteFoodModel) {
    setState(() {
      _favouriteFoodModel = favouriteFoodModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Résultats"),
      body: Column(
        children: [
          SizedBox(height: 30.0),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: CustomDropdown(
                dropdownMenuItemList: _favouriteFoodModelDropdownList,
                onChanged: _onChangeFavouriteFoodModelDropdown,
                value: _favouriteFoodModel,
                isEnabled: true,
              ),
            ),
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

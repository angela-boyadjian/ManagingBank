import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';
import 'package:mimi/ui/widgets/drop_down/custom_drop_down.dart';
import 'package:mimi/logic/cubit/drop_down/drop_down_cubit.dart';
import 'package:mimi/ui/screens/results/widgets/result_card.dart';
import 'package:mimi/ui/screens/results/widgets/prevision_card.dart';

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
          // Stack(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10.0),
          //           child: PrevisionCard(
          //               title: "Prévisionnel recettes", amount: "56 476,98 €"),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(right: 10.0),
          //           child: PrevisionCard(
          //               title: "Prévisionnel dépenses", amount: "13 445,25 €"),
          //         ),
          //       ],
          //     ),
          //     Center(
          //       child: BlocProvider(
          //         create: (_) => DropDownCubit(items, 0),
          //         child: CustomDropDown(),
          //       ),
          //     ),
          //     SizedBox(height: 10.0),
          //   ],
          // ),
          // SizedBox(height: 30.0),
          Center(
            child: BlocProvider(
              create: (_) => DropDownCubit(items, 0),
              child: CustomDropDown(),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrevisionCard(
                    title: "Prévisionnel recettes", amount: "56 476,98 €"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: PrevisionCard(
                    title: "Prévisionnel dépenses", amount: "13 445,25 €"),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          // Spacer(flex: 1),
          Flexible(
            flex: 1,
            child: ResultCard(
                title: "Dépenses",
                amount: "2 567,92 €",
                color: Color(0xFFFDAF3A)),
          ),
          Flexible(
            flex: 1,
            child: ResultCard(
                title: "Recettes",
                amount: "10 546,12 €",
                color: Color(0xFF48D73C)),
          ),
          Flexible(
            flex: 1,
            child: ResultCard(
                title: "Trésorerie",
                amount: "12 546,26 €",
                color: Color(0xFF5353E0)),
          ),
          Spacer(flex: 1),
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

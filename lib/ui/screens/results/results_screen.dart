import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/constants/constants.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';
import 'package:mimi/ui/widgets/drop_down/custom_drop_down.dart';
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
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(flex: 1),
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
              Flexible(
                flex: 1,
                child: ResultCard(
                  title: "Recettes",
                  color: Color(0xFF48D73C),
                  route: revenuesRoute,
                ),
              ),
              Flexible(
                flex: 1,
                child: BlocProvider.value(
                  value: BlocProvider.of<SpendingsCubit>(context),
                  child: ResultCard(
                    title: "Dépenses",
                    color: Theme.of(context).accentColor,
                    route: spendingsRoute,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: BlocProvider.value(
                  value: BlocProvider.of<BankAccountCubit>(context),
                  child: ResultCard(
                    title: "Trésorerie",
                    color: Color(0xFF5353E0),
                    route: treasuryRoute,
                  ),
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
          Positioned(
            top: 20,
            right: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.96,
            child: BlocProvider(
              create: (_) => DropDownCubit(items, 0),
              child: CustomDropDown(),
            ),
          ),
        ],
      ),
    );
  }
}

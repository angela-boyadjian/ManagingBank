import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/ui/screens/revenues/widgets/percentage_indicator.dart';

import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/ui/widgets/growth_card.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';
import 'package:mimi/ui/widgets/drop_down/custom_drop_down.dart';
import 'package:mimi/ui/screens/results/widgets/prevision_card.dart';

import 'widgets/percentage_indicator.dart';

class RevenuesScreen extends StatefulWidget {
  RevenuesScreen({Key key}) : super(key: key);

  @override
  _RevenuesScreenState createState() => _RevenuesScreenState();
}

class _RevenuesScreenState extends State<RevenuesScreen> {
  final List<DropDownModel> items = [
    DropDownModel(text: "Ce mois", selected: true),
    DropDownModel(text: "Ce trimestre", selected: false),
    DropDownModel(text: "Cette année"),
  ];

  Widget _buildCards(
      String fTitle, String fAmount, String sTile, String sAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: PrevisionCard(title: fTitle, amount: fAmount),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: PrevisionCard(title: sTile, amount: sAmount),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Recettes", previous: true),
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(flex: 1),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "10 587,12 €",
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF48D73C),
                          fontSize: 36,
                        ),
                  ),
                  SizedBox(width: 15),
                  GrowthCard(),
                ],
              ),
              SizedBox(height: 30.0),
              _buildCards("Espèces", "527,31 €", "Chèques", "2 003,79 €"),
              SizedBox(height: 20.0),
              _buildCards(
                  "Virements", "5 484,05 €", "Carte Bancaires", "2 531,10€"),
              SizedBox(height: 30.0),
              Flexible(
                flex: 1,
                child: PercentageIndicator("Espèces", "5%", 0.05),
              ),
              Flexible(
                flex: 1,
                child: PercentageIndicator("Chèques", "19%", 0.19),
              ),
              Flexible(
                flex: 1,
                child: PercentageIndicator("Virements", "52%", 0.52),
              ),
              Flexible(
                flex: 1,
                child: PercentageIndicator("Cartes bancaires", "24%", 0.24),
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

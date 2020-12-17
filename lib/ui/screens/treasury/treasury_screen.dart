import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/banks_card.dart';
import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/ui/widgets/growth_card.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';
import 'package:mimi/ui/widgets/drop_down/custom_drop_down.dart';

class TreasuryScreen extends StatefulWidget {
  TreasuryScreen({Key key}) : super(key: key);

  @override
  _TreasuryScreenState createState() => _TreasuryScreenState();
}

class _TreasuryScreenState extends State<TreasuryScreen> {
  final List<DropDownModel> items = [
    DropDownModel(text: "Ce mois", selected: true),
    DropDownModel(text: "Ce trimestre", selected: false),
    DropDownModel(text: "Cette année"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Trésorerie", previous: true),
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "12 546,26 €",
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5353E0),
                          fontSize: 36,
                        ),
                  ),
                  SizedBox(width: 15),
                  GrowthCard(),
                ],
              ),
              SizedBox(height: 30.0),
              Flexible(
                flex: 1,
                child: BanksCard("Revolut Business", "5 306,12 €", 0.4),
              ),
              Flexible(
                flex: 1,
                child: BanksCard("Crédit Agricole", "3 100,10 €", 0.3),
              ),
              Flexible(
                flex: 1,
                child: BanksCard("Quonto", "2 510,04 €", 0.2),
              ),
              Flexible(
                flex: 1,
                child: BanksCard("Amercian Express", "1 130,00 €", 0.1),
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

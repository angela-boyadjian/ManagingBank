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
    final BankAccountState bankAccounts =
        context.select((BankAccountCubit bloc) => bloc.state);

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
                    bankAccounts.amount,
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
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView.builder(
                    itemCount: bankAccounts.banks.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: BanksCard(bankAccounts.banks[index], 0.4),
                      );
                    }),
              ),
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

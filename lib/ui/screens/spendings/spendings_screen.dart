import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/ui/widgets/growth_card.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/widgets/drop_down/drop_down_model.dart';
import 'package:mimi/ui/widgets/custom_progress_indicator.dart';
import 'package:mimi/ui/widgets/drop_down/custom_drop_down.dart';
import 'package:mimi/ui/screens/spendings/widgets/spendings_card.dart';

import 'widgets/payment_card.dart';

class SpendingsScreen extends StatefulWidget {
  SpendingsScreen({Key key}) : super(key: key);

  @override
  _SpendingsScreenState createState() => _SpendingsScreenState();
}

// FIXME
class PaymentModel {
  final String title;
  final String amount;
  final double percent;

  PaymentModel(this.title, this.amount, this.percent);
}

class _SpendingsScreenState extends State<SpendingsScreen> {
  final List<DropDownModel> items = [
    DropDownModel(text: "Ce mois", selected: true),
    DropDownModel(text: "Ce trimestre", selected: false),
    DropDownModel(text: "Cette année"),
  ];

  final List<PaymentModel> _payments = [
    PaymentModel("Rémunérations, coti.", "5 306,12 €", 0.25),
    PaymentModel("Rémunérations, coti.", "5 306,12 €", 0.25),
    PaymentModel("Rémunérations, coti.", "5 306,12 €", 0.25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Dépenses", previous: true),
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocBuilder<SpendingsCubit, SpendingsState>(
                    builder: (context, state) {
                      if (state is SpendingsSuccess) {
                        return Text(
                          NumberFormat("###,000.0#", "fr")
                                  .format(state.spendings.data.attributes
                                      .balance.values.first)
                                  .toString() +
                              ' €',
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).accentColor,
                                fontSize: 36,
                              ),
                        );
                      }
                      return Center(child: CustomProgressIndicator());
                    },
                  ),
                  SizedBox(width: 15),
                  GrowthCard(isOrange: true),
                ],
              ),
              SizedBox(height: 30.0),
              Flexible(
                flex: 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _payments.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _payments.length) return SizedBox(width: 20.0);
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          PaymentCard(
                              _payments[index].title,
                              _payments[index].amount,
                              _payments[index].percent),
                          Flexible(
                            flex: 4,
                            child: Center(child: SpendingCard()),
                          ),
                        ],
                      ),
                    );
                  },
                ),
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

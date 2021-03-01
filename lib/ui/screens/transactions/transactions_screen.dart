import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/constants/constants.dart';
import 'package:mimi/logic/cubit/transactions/transactions_cubit.dart';
import 'package:mimi/ui/models/drop_downs.dart';
import 'package:mimi/ui/widgets/pending_card.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';

import 'widgets/transaction_card.dart';

class TransactionsScreen extends StatefulWidget {
  TransactionsScreen({Key key}) : super(key: key);

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final List<TransactionModel> _transactions = [
    TransactionModel("Prlv Droit de garde Titres", "-100,00 €", "0",
        "Sans catégorie", "MAI", "03"),
    TransactionModel("Le Rameau St Denis", "-92,20 €", "10",
        "Déplacement, missions, réceptions", "MAI", "02"),
    TransactionModel("Bricomarché", "-54,20 €", "multi-TVA", "Multi-catégories",
        "MAI", "02"),
    TransactionModel("Thalys", "-234,45 €", "10",
        "Déplacement, missions, réceptions", "AVR", "30"),
    TransactionModel("Prlv Droit de garde Titres", "-100,00 €", "0",
        "Sans catégorie", "MAI", "03"),
    TransactionModel("Le Rameau St Denis", "-92,20 €", "10",
        "Déplacement, missions, réceptions", "MAI", "02"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Transactions"),
      body: Column(
        children: [
          SizedBox(height: 30.0),
          Flexible(
            flex: 1,
            child: Center(
              child: BlocBuilder<TransactionsCubit, TransactionsState>(
                  builder: (context, state) {
                String name = "";
                if (state is TransactionsInitial ||
                    state is TransactionsInProgress) {
                  name = 'Loading...';
                }
                if (state is TransactionsSuccess) {
                  name = state.transactions[0].attributes.description;
                }
                return Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 24.0, fontWeight: FontWeight.w700),
                );
              }),
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: PendingCard(isTransaction: true),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: FractionalOffset(0.18, 0.5),
              child: Text(
                "-2 567, 92 €",
                style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Color(0xFFFDAF3A),
                    fontWeight: FontWeight.w700,
                    fontSize: 36),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(_transactions[index]);
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.88,
                    color: Color(0xFFEEEEFC),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: null,
      ),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        child: FloatingActionButton(
            child: Icon(FontAwesomeIcons.search, color: Colors.white, size: 22),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () => Navigator.of(context).pushNamed(searchRoute)),
      ),
    );
  }
}

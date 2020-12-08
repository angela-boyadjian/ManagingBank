import 'package:flutter/material.dart';

import 'package:mimi/ui/widgets/custom_app_bar.dart';

import 'widgets/to_validate_card.dart';
import 'widgets/transaction_card.dart';

class TransactionsScreen extends StatefulWidget {
  TransactionsScreen({Key key}) : super(key: key);

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
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
              child: ToValidateCard(),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: FractionalOffset(0.1, 0.5),
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
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return TransactionCard();
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
          // Spacer(flex: 2),
          // Spacer(flex: 2),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/constants/constants.dart';
import 'package:mimi/ui/widgets/pending_card.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';

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

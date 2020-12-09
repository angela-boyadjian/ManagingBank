import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/ui/widgets/pending_card.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';
import 'package:mimi/ui/screens/transactions/widgets/transaction_card.dart';

import 'widgets/declaration_card.dart';

class DeclarationsScreen extends StatefulWidget {
  DeclarationsScreen({Key key}) : super(key: key);

  @override
  _DeclarationsScreenState createState() => _DeclarationsScreenState();
}

class _DeclarationsScreenState extends State<DeclarationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Déclarations"),
      body: Column(
        children: [
          SizedBox(height: 30.0),
          Flexible(
            flex: 1,
            child: Center(
              child: PendingCard(isTransaction: false),
            ),
          ),
          SizedBox(height: 30.0),
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return DeclarationCard();
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
    );
  }
}

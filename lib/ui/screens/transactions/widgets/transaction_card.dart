import 'package:flutter/material.dart';

import 'package:mimi/constants/constants.dart';
import 'package:mimi/ui/models/drop_downs.dart';

import 'status_card.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel _transaction;

  TransactionCard(this._transaction);

  Widget _buildDate(context) {
    return Container(
      height: 55.0,
      width: 55.0,
      child: Card(
        elevation: 2.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 2.0),
              child: Text(_transaction.day,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Text(_transaction.month,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtitle(context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            _transaction.category,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontSize: 10.0,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              _transaction.amount + ' ',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  _transaction.tva == 'multi-TVA'
                      ? 'multi-TVA'
                      : 'TVA ${_transaction.tva}%',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(36, 36, 97, 0.6)),
                ),
              ),
            ),
            StatusCard(isValidate: false),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Color(0xFFEEEEFC),
      splashColor: Color(0xFFEEEEFC),
      onTap: () =>
          Navigator.pushNamed(context, detailsRoute, arguments: _transaction),
      child: ListTile(
        leading: _buildDate(context),
        title: Row(
          children: [
            Expanded(
              child: Text(
                _transaction.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Icon(Icons.more_horiz, color: Theme.of(context).primaryColor),
          ],
        ),
        subtitle: _buildSubtitle(context),
        isThreeLine: true,
      ),
    );
  }
}

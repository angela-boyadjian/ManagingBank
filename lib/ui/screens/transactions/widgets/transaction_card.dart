import 'package:flutter/material.dart';

import 'package:data/data_repository.dart';
import 'package:mimi/constants/constants.dart';
import 'package:mimi/ui/utils/date_converter.dart';
import 'package:mimi/ui/widgets/date/date_card.dart';

import 'status_card.dart';

class TransactionCard extends StatelessWidget {
  final TransactionAttributes _transactionAttributes;
  final DateConverter dateConverter = DateConverter();

  TransactionCard(this._transactionAttributes);

  String getCategory() {
    String category = "Sans catégorie";
    _transactionAttributes.transactionCategories.data.forEach((element) {
      if (element.attributes.kind != null) {
        category = element.attributes.kind;
      }
    });
    return category;
  }

  Widget _buildSubtitle(context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            getCategory(),
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
              _transactionAttributes.amount + ' ',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  'TVA 10%',
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
      onTap: () => Navigator.pushNamed(context, detailsRoute,
          arguments: _transactionAttributes),
      child: ListTile(
        leading: DateCard(
            date: dateConverter.convertDate(_transactionAttributes.date)),
        title: Row(
          children: [
            Expanded(
              child: Text(
                _transactionAttributes.description,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 12.0),
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

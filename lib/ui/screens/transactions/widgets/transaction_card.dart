import 'package:flutter/material.dart';

import 'status_card.dart';

class TransactionCard extends StatelessWidget {
  Widget _buildDate(context) {
    return Container(
      height: 55.0,
      width: 55.0,
      child: Card(
        elevation: 1.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 2.0),
              child: Text('03',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Text('MAI',
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
            'Multi-catégories',
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
              '-92,20 € ',
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
    return ListTile(
      leading: _buildDate(context),
      title: Row(
        children: [
          Expanded(
            child: Text(
              "Bricomarché",
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
    );
  }
}

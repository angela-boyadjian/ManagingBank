import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildDate(context),
      title: Text('Three-line ListTile'),
      subtitle: Text('A sufficiently long subtitle warrants three lines.'),
      trailing: Icon(Icons.more_horiz, color: Theme.of(context).primaryColor),
      isThreeLine: true,
    );
  }
}

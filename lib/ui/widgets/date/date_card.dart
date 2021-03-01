import 'package:flutter/material.dart';
import 'package:mimi/constants/constants.dart' as constants;
import 'date_model.dart';

class DateCard extends StatelessWidget {
  final DateModel date;

  DateCard({@required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 55.0,
      child: Card(
        elevation: 2.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 2.0),
              child: Text(date.day,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Text(constants.months[date.month],
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 10.0)),
          ],
        ),
      ),
    );
  }
}

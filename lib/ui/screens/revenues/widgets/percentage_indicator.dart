import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentageIndicator extends StatelessWidget {
  final String _title;
  final String _amount;
  final double _percent;

  PercentageIndicator(this._title, this._amount, this._percent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearPercentIndicator(
          alignment: MainAxisAlignment.center,
          width: MediaQuery.of(context).size.width * 0.95,
          lineHeight: 8.0,
          percent: _percent,
          linearGradient: LinearGradient(
            colors: [Color(0xFF5353E0), Color(0xFF7979DC)],
          ),
          linearStrokeCap: LinearStrokeCap.roundAll,
          backgroundColor: Theme.of(context).highlightColor,
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                _title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                _amount,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: 14.0,
                    color: Theme.of(context).primaryColor.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentageIndicator extends StatelessWidget {
  final String _title;
  final String _amount;
  final double _percent;

  PercentageIndicator(this._title, this._amount, this._percent);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            lineHeight: 8.0,
            percent: _percent,
            linearGradient: LinearGradient(
              colors: [Color(0xFF5353E0), Color(0xFF7979DC)],
            ),
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: Theme.of(context).highlightColor,
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  _title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Text(
                  _amount,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 10.0,
                      color: Color(0xFF242461).withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

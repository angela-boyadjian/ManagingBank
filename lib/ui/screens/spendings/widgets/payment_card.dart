import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PaymentCard extends StatelessWidget {
  final String _title;
  final String _amount;
  final double _percent;

  PaymentCard(this._title, this._amount, this._percent);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              radius: 64.0,
              lineWidth: 6.0,
              percent: _percent,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "${_percent * 100} %",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
              linearGradient: LinearGradient(
                colors: [Color(0xFF5353E0), Color(0xFF7979DC)],
              ),
              backgroundColor: Theme.of(context).highlightColor,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    _title,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Color(0xFF242461).withOpacity(0.6),
                        fontSize: 14.0),
                  ),
                ),
                Text(
                  _amount,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
              ],
            ),
            SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:data/data_repository.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BanksCard extends StatelessWidget {
  final DatumAttributes _bank;
  final double _percent;

  BanksCard(this._bank, this._percent);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: 90.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: NetworkImage(_bank.bank.data.links.logoUrl), // FIXME Fetch image fail
                  // ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF5F5F5),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          _bank.name,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Color(0xFF242461).withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                    Text(
                      _bank.currentBankBalance.toString(),
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: CircularPercentIndicator(
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
            ),
          ],
        ),
      ),
    );
  }
}

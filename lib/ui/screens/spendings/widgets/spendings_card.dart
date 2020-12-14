import 'package:flutter/material.dart';
import 'percentage_indicator.dart';

class SpendingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
              PercentageIndicator("Prélévement personnel", "5 203,50 €", 0.4),
            ],
          ),
        ),
      ),
    );
  }
}

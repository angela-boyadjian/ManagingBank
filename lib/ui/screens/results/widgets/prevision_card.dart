import 'package:flutter/material.dart';

class PrevisionCard extends StatelessWidget {
  final String title;
  final String amount;

  PrevisionCard({@required this.title, @required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0),
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(0.0, 5.0),
            blurRadius: 4.0,
          ),
        ],
        gradient: LinearGradient(
            colors: [Color(0xFF7979DC), Theme.of(context).primaryColor],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontSize: 14.0, color: Colors.white),
          ),
          SizedBox(height: 5.0),
          Text(
            amount,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

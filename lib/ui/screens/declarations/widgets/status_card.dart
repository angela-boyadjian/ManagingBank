import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final bool isValidate;

  StatusCard({@required this.isValidate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.0,
      width: isValidate ? 68.0 : 73.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        gradient: LinearGradient(
            colors: isValidate
                ? [Color(0xFFBFF1BB), Color(0xFF98E891)]
                : [Color(0xFFFFEDD2), Color(0xFFFED89F)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(36, 36, 97, 0.16),
            offset: Offset(0.0, 4.0),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          isValidate ? "Complétée" : "À compléter",
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: isValidate ? Color(0xFF32BA26) : Color(0xFFE39D34),
              fontSize: 10.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GrowthCard extends StatelessWidget {
  final bool isOrange;

  GrowthCard({this.isOrange = false});

  @override
  Widget build(BuildContext context) {
    final Color _color = isOrange ? Color(0xFFE6B72A) : Color(0xFF32BA26);
    final List<Color> _gradient = isOrange
        ? [Color(0xFFFFEFC1), Color(0xFFFFE597)]
        : [Color(0xFFBFF1BB), Color(0xFF98E891)];

    return Container(
      height: 24.0,
      width: 53.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            colors: _gradient,
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Icon(
              FontAwesomeIcons.compressAlt,
              color: _color,
              size: 12,
            ),
          ),
          Text(
            "+7%",
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: _color,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'status_card.dart';

class DeclarationCard extends StatelessWidget {
  Widget _buildSubtitle(context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Déclaration complétée le 01/07/21',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  '-7 451,00 €',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF242461).withOpacity(0.6)),
                ),
              ),
            ),
            StatusCard(isValidate: true),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "2e trimestre 2021",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
          Icon(FontAwesomeIcons.eye,
              color: Theme.of(context).primaryColor, size: 12.0),
        ],
      ),
      subtitle: _buildSubtitle(context),
      isThreeLine: true,
    );
  }
}

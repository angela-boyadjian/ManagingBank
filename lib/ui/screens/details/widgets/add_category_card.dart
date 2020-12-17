import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/constants/constants.dart';

class AddCategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: () => Navigator.of(context).pushNamed(addCategoryRoute),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.plusCircle,
                  color: Theme.of(context).primaryColor, size: 14.0),
              SizedBox(width: 8.0),
              Text(
                'Ajouter une catégorie',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

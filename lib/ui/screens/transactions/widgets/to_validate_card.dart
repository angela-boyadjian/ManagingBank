import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToValidateCard extends StatelessWidget {
  Widget _buildNumberButton(context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      height: 55,
      width: 55,
      child: RawMaterialButton(
        onPressed: () {},
        elevation: 8.0,
        fillColor: Theme.of(context).primaryColor,
        child: Text("1",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white)),
        padding: EdgeInsets.all(10.0),
        shape: CircleBorder(),
      ),
    );
  }

  Widget _buildText(context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            "Transaction ",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            "à valider",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.0,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width - 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNumberButton(context),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildText(context),
                    Text(
                      "Aujourd'hui 9:00",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Color(0xFF242461).withOpacity(0.6),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(FontAwesomeIcons.chevronRight,
                      color: Color.fromRGBO(36, 36, 97, 0.6)),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DisabledButton extends StatelessWidget {
  final String text;

  DisabledButton({@required this.text});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(10.0),
      color: theme.primaryColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFFEEEEFC),
        ),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width * 0.9,
          height: 55.0,
          onPressed: () {},
          child: Text(
            text,
            style: theme.textTheme.subtitle1.copyWith(
              color: Color(0xFF242461).withOpacity(0.25),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

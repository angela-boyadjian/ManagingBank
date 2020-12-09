import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({@required this.onPressed, @required this.text});

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
          gradient: LinearGradient(
              colors: [Color(0xFF373794), theme.primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width - 80,
            height: 55.0,
            onPressed: onPressed,
            child: Text(text,
                style:
                    theme.textTheme.subtitle1.copyWith(color: Colors.white))),
      ),
    );
  }
}

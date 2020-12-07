import 'package:flutter/material.dart';

import 'package:mimi/ui/widgets/custom_button.dart';

class CustomCard extends StatefulWidget {
  CustomCard({Key key}) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration _textFieldDecoration(String hintText) {
    var style = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(color: Color.fromRGBO(36, 36, 97, 0.27));

    return InputDecoration(
      labelText: hintText,
      hintText: hintText,
      labelStyle: style,
      hintStyle: style,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  "Bienvenue !",
                  style: theme.textTheme.headline5.copyWith(
                      color: theme.primaryColor, fontWeight: FontWeight.bold),
                ),
              )),
          SizedBox(height: 15.0),
          Flexible(
              flex: 1,
              child: Text(
                "Pour continuer, merci de vous identifier.",
                style: theme.textTheme.subtitle2
                    .copyWith(color: theme.primaryColor),
              )),
          SizedBox(height: 30.0),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: _textFieldDecoration("Email"),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                decoration: _textFieldDecoration("Mot de passe"),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Image.asset("assets/images/login_illustration.png"),
            ),
          ),
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: CustomButton(onPressed: () => {}, text: "Se connecter"),
            ),
          ),
        ],
      ),
    );
  }
}

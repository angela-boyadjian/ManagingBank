import 'package:flutter/material.dart';
import 'package:mimi/ui/widgets/custom_button.dart';

class ResetCard extends StatefulWidget {
  ResetCard({Key key}) : super(key: key);

  @override
  _ResetCardState createState() => _ResetCardState();
}

class _ResetCardState extends State<ResetCard> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
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
                  "Mot de passe oublié ?",
                  style: theme.textTheme.headline6.copyWith(
                      color: theme.primaryColor, fontWeight: FontWeight.bold),
                ),
              )),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Merci d'inscrire votre adresse email et de suivre les intructions.",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.subtitle2
                      .copyWith(color: theme.primaryColor),
                ),
              )),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                decoration: _textFieldDecoration("Email"),
              ),
            ),
          ),
          Spacer(flex: 6),
          Flexible(
            flex: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(onPressed: () => {}, text: "Continuer"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/constants/constants.dart';
import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/ui/widgets/custom_button.dart';

class LoginCard extends StatefulWidget {
  LoginCard({Key key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
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

  Widget _getSuffix() => Visibility(
        visible: passwordController.text.isNotEmpty,
        child:
            Icon(FontAwesomeIcons.eye, color: Theme.of(context).primaryColor),
      );

  InputDecoration _textFieldDecoration(String hintText, bool isPassword) {
    var style = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(color: Color.fromRGBO(36, 36, 97, 0.27));

    return InputDecoration(
      labelText: hintText,
      hintText: hintText,
      labelStyle: style,
      hintStyle: style,
      suffixIcon: isPassword ? _getSuffix() : null,
      suffixStyle: Theme.of(context)
          .textTheme
          .subtitle2
          .copyWith(color: Theme.of(context).primaryColor),
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
                controller: emailController,
                decoration: _textFieldDecoration("Email", false),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: _textFieldDecoration("Mot de passe", true),
                  ),
                  Visibility(
                    visible: passwordController.text.isEmpty,
                    child: FlatButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed(resetRoute),
                        child: Text(
                          "Mot de passe oublié ?",
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
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
              child: CustomButton(
                  onPressed: () => BlocProvider.of<LoginCubit>(context)
                      .logInWithCredentials(
                          emailController.text, passwordController.text),
                  text: "Se connecter"),
            ),
          ),
        ],
      ),
    );
  }
}

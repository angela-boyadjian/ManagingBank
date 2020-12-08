import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/ui/widgets/custom_app_bar.dart';

import 'widgets/user_card.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _horizontalLine() => Container(
        width: MediaQuery.of(context).size.width,
        height: 0.88,
        color: Color(0xFFEEEEFC),
      );

  Widget _buildButton(String text, IconData icon) => FlatButton(
        color: Colors.transparent,
        splashColor: Colors.black26,
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(icon, color: Theme.of(context).primaryColor),
            ),
            SizedBox(width: 20.0),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: 14.0, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: CustomAppBar("Mon compte"),
      body: Column(
        children: [
          SizedBox(height: 10.0),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: UserCard(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: _buildButton("FAQ", FontAwesomeIcons.questionCircle),
            ),
          ),
          _horizontalLine(),
          Flexible(
            flex: 2,
            child: _buildButton("Contact", FontAwesomeIcons.commentAlt),
          ),
          _horizontalLine(),
          Flexible(
            flex: 2,
            child: _buildButton("À propos", FontAwesomeIcons.bars),
          ),
          _horizontalLine(),
          Flexible(
            flex: 2,
            child: FlatButton(
              color: Colors.transparent,
              splashColor: Colors.black26,
              onPressed: () {},
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(FontAwesomeIcons.signOutAlt,
                        color: Color(0xFFFF4848)),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    "Se déconnecter",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Color(0xFFFF4848),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimi/logic/bloc/bloc.dart';
import 'package:users/users_repository.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = context.select((UserBloc bloc) => bloc.state.user);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10.0,
      child: InkWell(
        splashColor: Colors.white,
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width - 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Color(0xFF373794)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        '${user.firstname} ${user.lastname}',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '${user.email}',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(FontAwesomeIcons.cog, color: Colors.white),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

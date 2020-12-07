import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/constants/constants.dart';
import 'package:mimi/logic/cubit/preferences/preferences_cubit.dart';

class GeneralSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("General Settings",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        Card(
          elevation: 2.0,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.userAlt,
                    color: Colors.blue,
                  ),
                  title: Text("Account"),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.language,
                    color: Colors.lightGreen,
                  ),
                  title: Text("Language"),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.solidSun,
                  color: Colors.amber[800],
                ),
                title: Text('Light Theme'),
                trailing: BlocBuilder<PreferencesCubit, PreferencesState>(
                  builder: (context, state) {
                    return Switch(
                      value: context.watch<PreferencesCubit>().theme,
                      onChanged: (val) =>
                          context.read<PreferencesCubit>().setTheme(val),
                    );
                  },
                ),
              ),
              GestureDetector(
                  onTap: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthenticationLogoutRequested());
                    Navigator.pushNamedAndRemoveUntil(
                        context, loginRoute, (route) => false);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                    title: Text("Logout"),
                    trailing: Icon(Icons.arrow_right),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

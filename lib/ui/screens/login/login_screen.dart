import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:users/users_repository.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/constants/constants.dart';

import 'widgets/custom_card.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 1.0,
          color: Colors.white.withOpacity(0.6),
        ),
      );

  InputDecoration textFieldDecoration(String hintText) => InputDecoration(
        labelText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserBloc, UserState>(listener: (userContext, state) {
          switch (state.status) {
            case UserStatus.Success:
              return Navigator.of(context).pushNamed(homeRoute);
            case UserStatus.NoUser:
              final user =
                  BlocProvider.of<AuthenticationBloc>(context).state.user;
              BlocProvider.of<UserBloc>(context).add(AddUser(User(
                  user.id, user.email, user.name, user.photo, 'new user')));
              break;
            case UserStatus.Error:
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Failed to get user in DB',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                );
              break;
            default:
              break;
          }
        }),
        BlocListener<LoginCubit, LoginState>(
          listener: (loginContext, state) {
            if (state is LoginError) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black38,
                    content: Text('Authentication failed',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.red)),
                  ),
                );
            }
          },
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Color(0xFF373794)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      scale: 1.3,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: CustomCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

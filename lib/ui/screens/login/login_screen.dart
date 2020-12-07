import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:users/users_repository.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/logic/cubit/cubit.dart';
import 'package:mimi/constants/constants.dart';
import 'package:mimi/ui/widgets/auth_button.dart';

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

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ColorizeAnimatedTextKit(
            text: ["Template"],
            isRepeatingAnimation: true,
            textStyle: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: Colors.white),
            colors: [
              Colors.white,
              Colors.blue,
              Colors.yellow,
              Colors.red,
              Colors.orange,
            ],
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.center),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.orange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildTitle(),
                    SizedBox(height: 45.0),
                    TextField(
                      controller: emailController,
                      style: textTheme.subtitle1,
                      decoration: textFieldDecoration('Email'),
                    ),
                    SizedBox(height: 25.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: textTheme.subtitle1,
                      decoration: textFieldDecoration('Password'),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    AuthButton(
                        text: 'Login',
                        onPressed: () => Navigator.of(context).pushNamed(homeRoute)),
                        // onPressed: () => context
                        //     .read<LoginCubit>()
                        //     .logInWithCredentials(
                        //         emailController.text, passwordController.text)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

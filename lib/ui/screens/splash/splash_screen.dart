import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:authentication/authentication_repository.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/ui/widgets/frame.dart';
import 'package:mimi/constants/constants.dart';
import 'package:mimi/logic/cubit/login/login_cubit.dart';
import 'package:mimi/ui/screens/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  Widget _buildLogo() => Align(
        alignment: FractionalOffset(0.5, 0.2),
        child: Image.asset(
          "assets/images/logo_splash.png",
          key: const Key('splash_bloc_image'),
          height: 400.0,
        ),
      );

  Widget getAuth() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      switch (state.status) {
        case AuthenticationStatus.Authenticated:
          return BlocProvider(
            create: (context) => TabBloc(),
            child: Frame(),
          );
        case AuthenticationStatus.Unauthenticated:
          return BlocProvider(
            create: (context) =>
                LoginCubit(context.read<AuthenticationRepository>()),
            child: LoginScreen(),
          );
          break;
        default:
          return _buildLogo();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (context, state) {
            if (state is Initial) {
              BlocProvider.of<SplashScreenBloc>(context).add(LoadResources());
              return _buildLogo();
            } else if (state is Loading) {
              return _buildLogo();
            }
            return getAuth();
          },
        ),
      ),
    );
  }
}

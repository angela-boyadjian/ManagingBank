import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/ui/widgets/frame.dart';
import 'package:mimi/constants/constants.dart';
import 'package:mimi/ui/screens/login/login_screen.dart';
import 'package:mimi/ui/screens/login/reset_screen.dart';
import 'package:mimi/ui/screens/search/search_screen.dart';
import 'package:mimi/ui/screens/splash/splash_screen.dart';
import 'package:mimi/ui/screens/profile/profile_screen.dart';
import 'package:mimi/ui/screens/settings/settings_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SplashScreenBloc(),
            child: SplashScreen(),
          ),
        );
      case loginRoute:
        return PageTransition(
          child: LoginScreen(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
        );
      case resetRoute:
        return PageTransition(
          child: ResetScreen(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
        );
      case searchRoute:
        return PageTransition(
          child: SearchScreen(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
        );
      case profileRoute:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case settingsRoute:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );
      case homeRoute:
        return PageTransition(
            child: BlocProvider(
              create: (context) => TabBloc(),
              child: Frame(),
            ),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 400));
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/ui/screens/categories/categories_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/ui/widgets/frame.dart';
import 'package:mimi/constants/constants.dart';
import 'package:mimi/ui/models/drop_downs.dart';
import 'package:mimi/ui/screens/login/login_screen.dart';
import 'package:mimi/ui/screens/login/reset_screen.dart';
import 'package:mimi/ui/screens/search/search_screen.dart';
import 'package:mimi/ui/screens/splash/splash_screen.dart';
import 'package:mimi/ui/screens/details/details_screen.dart';
import 'package:mimi/ui/screens/profile/profile_screen.dart';
import 'package:mimi/ui/screens/treasury/treasury_screen.dart';
import 'package:mimi/ui/screens/revenues/revenues_screen.dart';
import 'package:mimi/ui/screens/settings/settings_screen.dart';
import 'package:mimi/ui/screens/spendings/spendings_screen.dart';
import 'package:mimi/ui/screens/add_category/add_category_screen.dart';

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
      case revenuesRoute:
        return PageTransition(
          child: RevenuesScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: Duration(milliseconds: 400),
        );
      case treasuryRoute:
        return PageTransition(
          child: TreasuryScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: Duration(milliseconds: 400),
        );
      case spendingsRoute:
        return PageTransition(
          child: SpendingsScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: Duration(milliseconds: 400),
        );
      case detailsRoute:
        TransactionModel transaction = settings.arguments as TransactionModel;
        return PageTransition(
          child: DetailsScreen(transaction: transaction),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
        );
      case addCategoryRoute:
        return PageTransition(
          child: AddCategoryScreen(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
        );
      case categoriesRoute:
        return PageTransition(
          child: CategoriesScreen(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
        );
      case settingsRoute:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );
      default:
        return null;
    }
  }
}

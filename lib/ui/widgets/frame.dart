import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/logic/cubit/cubit.dart';

import 'package:users/users_repository.dart';

import 'package:mimi/logic/bloc/bloc.dart';
import 'package:mimi/constants/constants.dart';
import 'package:mimi/ui/screens/results/results_screen.dart';
import 'package:mimi/ui/screens/profile/profile_screen.dart';
import 'package:mimi/ui/screens/declarations/declarations_screen.dart';
import 'package:mimi/ui/screens/transactions/transactions_screen.dart';

import 'nav_bar.dart';

class Frame extends StatefulWidget {
  Frame();

  @override
  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame> with SingleTickerProviderStateMixin {
  final double iconSize = 20.0;
  PageController pageController;
  final Color iconColor = Colors.white;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: TabScreens.Results.index,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  navBarChangePage(int index) {
    BlocProvider.of<TabBloc>(context).add(TabUpdated(TabScreens.values[index]));
    pageController.jumpToPage(index);
  }

  // TODO Cache page ?
  // TransactionsScreen t = TransactionsScreen();
  // ResultsScreen r = ResultsScreen();
  // DeclarationsScreen d = DeclarationsScreen();
  // ProfileScreen p = ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final User user = context.select((UserBloc bloc) => bloc.state.user);

    return BlocBuilder<TabBloc, TabScreens>(
      builder: (context, activeTab) {
        return Scaffold(
          key: _scaffoldKey,
          body: PageView(
            children: <Widget>[
              BlocProvider(
                create: (context) => TransactionsBloc(
                    context.read<DataRepository>(), user?.uuid, user?.header)
                  ..add(TransactionsFetched()),
                child: TransactionsScreen(),
              ),
              MultiBlocProvider(
                providers: [
                  BlocProvider<BankAccountCubit>(
                    create: (context) => BankAccountCubit(
                        context.read<DataRepository>(),
                        user?.uuid,
                        user?.header),
                  ),
                  BlocProvider<SpendingsCubit>(
                    create: (context) => SpendingsCubit(
                      context.read<DataRepository>(),
                      user?.uuid,
                      user?.header,
                      user?.organization?.uuid,
                    ),
                  ),
                ],
                child: ResultsScreen(),
              ),
              DeclarationsScreen(),
              ProfileScreen()
            ],
            controller: pageController,
            onPageChanged: (pageIndex) => BlocProvider.of<TabBloc>(context)
                .add(TabUpdated(TabScreens.values[pageIndex])),
          ),
          bottomNavigationBar: NavBar(
            bottomNavigationKey: _bottomNavigationKey,
            activeTab: activeTab,
            onTabSelected: navBarChangePage,
          ),
        );
      },
    );
  }
}

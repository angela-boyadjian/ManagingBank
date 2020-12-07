import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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

  navBarChangePage(TabScreens tab) {
    BlocProvider.of<TabBloc>(context).add(TabUpdated(tab));
    pageController.animateToPage(tab.index,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabScreens>(
      builder: (context, activeTab) {
        return Scaffold(
          key: _scaffoldKey,
          body: PageView(
            children: <Widget>[
              TransactionsScreen(),
              ResultsScreen(),
              DeclarationsScreen(),
              ProfileScreen(),
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

import 'package:flutter/material.dart';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mimi/constants/constants.dart';

class NavBar extends StatelessWidget {
  final TabScreens activeTab;
  final double iconSize = 20.0;
  final GlobalKey bottomNavigationKey;
  final Color iconColor = Colors.white;
  final Function(int) onTabSelected;

  NavBar(
      {Key key,
      @required this.bottomNavigationKey,
      @required this.activeTab,
      @required this.onTabSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
          ),
        ],
      ),
      child: FFNavigationBar(
        key: bottomNavigationKey,
        theme: FFNavigationBarTheme(
          barBackgroundColor: Theme.of(context).primaryColor,
          selectedItemBorderColor: Colors.white,
          selectedItemBackgroundColor: Colors.white,
          selectedItemIconColor: Theme.of(context).primaryColor,
          selectedItemLabelColor: Colors.white,
          unselectedItemIconColor: Colors.white,
          unselectedItemLabelColor: Colors.white,
          unselectedItemTextStyle:
              Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 10.0),
          barHeight: 80.0,
          showSelectedItemShadow: false,
          itemWidth: 60.0,
        ),
        selectedIndex: TabScreens.values.indexOf(activeTab),
        onSelectTab: (index) => onTabSelected(index),
        items: [
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.arrowLeft,
            label: "Transactions",
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.chartLine,
            label: "Resultats",
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.archive,
            label: "Declarations",
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.user,
            label: "Mon compte",
          ),
        ],
      ),
    );
  }
}

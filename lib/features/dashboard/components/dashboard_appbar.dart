import 'package:flutter/material.dart';

import '../../../app/styles/dimension.dart';

class DashboardAppBar extends AppBar {
  
  DashboardAppBar({super.key, this.bottomTabs, required this.actionWidgets}) : super(
    title: Text(
      "Hello, Gastuser!",
      style: TextStyle(
        fontSize: Dimension.fontLarge,
        fontWeight: FontWeight.w400,
        color: Colors.black
      ),
    ),
    backgroundColor: Colors.transparent,
    centerTitle: false,
    bottom: bottomTabs,
    actions: actionWidgets
  );

  final PreferredSizeWidget? bottomTabs;
  final List<Widget> actionWidgets;
}
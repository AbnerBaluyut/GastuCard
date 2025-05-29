import 'package:flutter/material.dart';

import '../../../app/styles/dimension.dart';

class DashboardAppBar extends AppBar {
  
  DashboardAppBar({super.key, this.bottomTabs, required this.onTapSettings}) : super(
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
    actions: [
      IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.settings)
      )
    ]
  );

  final PreferredSizeWidget? bottomTabs;
  final VoidCallback onTapSettings;
}
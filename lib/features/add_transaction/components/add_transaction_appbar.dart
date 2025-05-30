import 'package:flutter/material.dart';

import '../../../app/styles/dimension.dart';

class AddTransactionAppBar extends AppBar {
  
  AddTransactionAppBar({super.key}) : super(
    title: Text(
      "Add Transaction",
      style: TextStyle(
        fontSize: Dimension.fontLarge,
        fontWeight: FontWeight.w400,
        color: Colors.black
      ),
    ),
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    centerTitle: false,
  );
}
import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';

import '../../../app/styles/dimension.dart';

class SummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const SummaryItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: Colors.teal.shade800, fontSize: Dimension.fontMedium, fontWeight: FontWeight.w700)),
        Dimension.spacingExtraSmall.height(),
        Text(title, style: TextStyle(fontSize: Dimension.fontSmall, fontWeight: FontWeight.w500, color: Colors.blueGrey)),
      ],
    );
  }
}
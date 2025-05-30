import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/date_ext.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';

import '../../../app/styles/dimension.dart';

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;

  const TransactionItem({super.key, 
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(Dimension.paddingMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Icon(Icons.restaurant_menu, color: Colors.teal),
            ),
            Dimension.spacingSmall.width(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Krispy Kreme",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Dimension.fontMedium,
                      color: Colors.teal.shade800
                    )
                  ),
                  Text(
                    "Food", 
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimension.fontSmall,
                      color: Colors.blueGrey
                    )
                  ),
                ],
              ),
            ),
            Dimension.spacingMedium.width(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "-${1000.toCurrency()}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.teal.shade800,
                    fontSize: Dimension.fontMedium
                  ),
                ),
                Text(
                  DateTime.now().format(pattern: "hh:mm a"),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    fontSize: Dimension.fontSmall
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
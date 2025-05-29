import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/date_ext.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';

import '../../../app/styles/custom_colors.dart';
import '../../../app/styles/dimension.dart';

class RecentTransactionsSection extends StatelessWidget {

  const RecentTransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(
        horizontal: Dimension.marginMedium
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimension.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Recent Transactions",
                    style: TextStyle(
                      fontSize: Dimension.fontMedium,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ),
                  onPressed: () {}, 
                  child: Text(
                    "See All",
                    style: TextStyle(
                      fontSize: Dimension.fontMedium,
                      fontWeight: FontWeight.w400
                    ),
                  )
                )
              ],
            ),
            Dimension.spacingSmall.height(),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: CustomColors.primaryColor,
                      child: Icon(Icons.restaurant),
                    ),
                    Dimension.spacingSmall.width(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Krispy Kreme", 
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimension.fontSmall
                            )
                          ),
                          Text(
                            "Category: Food",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimension.fontExtraSmall,
                              color: Colors.grey
                            )
                          ),
                          Text(
                            "Date: ${DateTime.now().format(pattern: "MMM dd, yyyy")}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimension.fontExtraSmall,
                              color: Colors.grey
                            )
                          )
                        ],
                      ),
                    ),
                    Dimension.spacingMedium.width(),
                    Text(
                      "-${1000.toCurrency()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.red
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Dimension.spacingMedium.height();
              },
              itemCount: 5,
            ),
            Dimension.spacingSmall.height(),
          ],
        ),
      ),
    );
  }
}
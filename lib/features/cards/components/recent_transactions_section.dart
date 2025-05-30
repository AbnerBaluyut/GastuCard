import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/date_ext.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';

import '../../../app/styles/dimension.dart';

class RecentTransactionsSection extends StatelessWidget {

  const RecentTransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
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
                      fontWeight: FontWeight.w700,
                      color: Colors.teal.shade800
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
                      fontWeight: FontWeight.w500,
                      color: Colors.teal.shade800
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
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimension.paddingSmall
                  ),
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
                            DateTime.now().format(pattern: "MMM dd"),
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
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                );
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
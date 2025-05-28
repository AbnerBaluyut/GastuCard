import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/date_ext.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';

import '../../../app/styles/dimension.dart';

class RecentTransactions extends StatelessWidget {

  const RecentTransactions({super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: Dimension.elevationLow,
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
                      fontSize: Dimension.fontLarge,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                TextButton(
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
            const SizedBox(height: 12),
            _buildTransactionRow(),
            _buildTransactionRow(),
            _buildTransactionRow(),
            _buildTransactionRow(),
            _buildTransactionRow()
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            child: Icon(Icons.local_cafe, color: Colors.blue),
          ),
          const SizedBox(width: 12),
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
                  "Food & Drinks • ${DateTime.now().format(pattern: "MMM dd, yyyy")}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Dimension.fontExtraSmall,
                    color: Colors.grey
                  )
                ),
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
      ),
    );
  }
}
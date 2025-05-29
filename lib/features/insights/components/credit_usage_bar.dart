import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';

import '../../../app/styles/custom_colors.dart';
import '../../../app/styles/dimension.dart';

class CreditUsageBar extends StatelessWidget {
  final double spent;
  final double limit;

  const CreditUsageBar({
    super.key,
    required this.spent,
    required this.limit,
  });

  @override
  Widget build(BuildContext context) {
    final percentUsed = (spent / limit);
    final remaining = (limit - spent);

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(Dimension.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Spending vs Credit Limit',
              style: TextStyle(fontSize: Dimension.fontMedium, fontWeight: FontWeight.w600)
            ),
            Dimension.spacingMedium.height(),
            LinearProgressIndicator(
              value: percentUsed,
              color: CustomColors.primaryColor,
              backgroundColor: Colors.grey.shade300,
              minHeight: 14.0,
              borderRadius: BorderRadius.circular(Dimension.radiusMedium),
            ),
            Dimension.spacingMedium.height(),
            Text(
              '${spent.toCurrency()} used of ${limit.toCurrency()}',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: Dimension.fontSmall,
                fontWeight: FontWeight.w400
              ),
            ),
            Text(
              '${remaining.toCurrency()} available credit',
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: Dimension.fontSmall,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    );
  }
}

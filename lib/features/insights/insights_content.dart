import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';

import '../../app/styles/custom_colors.dart';
import '../../app/styles/dimension.dart';
import 'components/credit_usage_bar.dart';

class InsightsContent extends StatelessWidget {
  const InsightsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Dimension.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            icon: Icons.show_chart,
            title: 'Spending Trend',
            child: Container(
              height: 200,
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: const Text('Chart Placeholder'),
            ),
          ),
          Dimension.spacingLarge.height(),
          _buildSection(
            icon: Icons.pie_chart,
            title: 'Spending Overview',
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "₱12,450.00 spent this month",
                  style: TextStyle(
                    fontSize: Dimension.fontSmall,
                    fontWeight: FontWeight.w400
                  ),
                ),
                Text(
                  "₱415/day on average",
                  style: TextStyle(
                    fontSize: Dimension.fontSmall,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          ),
          Dimension.spacingLarge.height(),
          CreditUsageBar(
            spent: 26123,
            limit: 50000,
          ),
          Dimension.spacingLarge.height(),
          _buildSection(
            icon: Icons.category,
            title: 'Category Breakdown',
            child: Column(
              spacing: Dimension.spacingSmall,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(5, (_) {
                return Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: CustomColors.primaryColor,
                            radius: 16.0,
                            child: Icon(Icons.restaurant, size: 18.0),
                          ),
                          Dimension.spacingSmall.width(),
                          Text(
                            "Food", 
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimension.fontSmall
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
                );
              }),
            ),
          ),
          Dimension.spacingTeraLarge.height(),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(Dimension.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Spacer()
              ],
            ),
            Dimension.spacingMedium.height(),
            child,
          ],
        ),
      ),
    );
  }
}
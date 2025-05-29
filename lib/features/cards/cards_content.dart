import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';

import '../../app/styles/dimension.dart';
import 'components/cards_section.dart';
import 'components/monthly_summary_section.dart';
import 'components/recent_transactions_section.dart';

class CardsContent extends StatelessWidget {
  const CardsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Dimension.spacingMedium.height(),
          CardsSection(
            cards: [
              0,
              1,
              2
            ],
          ),
          Dimension.spacingLarge.height(),
          MonthlySummarySection(
            statementDate: DateTime.now(),
            paymentDueDate: DateTime.now(),
            totalDue: 16000,
          ),
          Dimension.spacingLarge.height(),
          RecentTransactionsSection(),
          Dimension.spacingTeraLarge.height(),
        ],
      )
    );
  }
}
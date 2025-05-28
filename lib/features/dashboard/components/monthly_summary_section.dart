import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/date_ext.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';

import '../../../app/styles/dimension.dart';

class MonthlySummarySection extends StatelessWidget {
  const MonthlySummarySection({
    super.key,
    required this.statementDate,
    required this.paymentDueDate,
    this.totalDue = 0
  });

  final DateTime statementDate;
  final DateTime paymentDueDate;
  final double totalDue;

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
            Text(
              "Monthly Summary",
              style: TextStyle(
                fontSize: Dimension.fontLarge,
                fontWeight: FontWeight.w600
              ),
            ),
            Dimension.spacingMedium.height(),
            _buildSummaryRow(Icons.receipt_long, "Statement Date", statementDate.format(pattern: "MMM dd, yyyy")),
            _buildSummaryRow(Icons.event, "Payment Due", statementDate.format(pattern: "MMM dd, yyyy")),
            _buildSummaryRow(Icons.account_balance_wallet, "Total Due", totalDue.toCurrency()),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          Dimension.spacingSmall.width(),
          Expanded(
            child: Text(
              label, 
              style: const TextStyle(
                fontSize: Dimension.fontSmall,
                fontWeight: FontWeight.w400
              ),                
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Dimension.fontSmall
            ),
          ),
        ],
      ),
    );
  }
}
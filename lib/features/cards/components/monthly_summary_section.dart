import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/date_ext.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';
import '../../../app/styles/dimension.dart';

class MonthlySummarySection extends StatefulWidget {
  const MonthlySummarySection({
    super.key,
    required this.statementDay,
    required this.paymentDay,
    this.totalDue = 0
  });

  final int statementDay;
  final int paymentDay;
  final double totalDue;

  @override
  State<StatefulWidget> createState() => _MonthlySummarySectionState();
}

class _MonthlySummarySectionState extends State<MonthlySummarySection> {

  DateTime getCurrentStatementEndDate(DateTime today, int statementDay) {
    final thisMonthStatement = DateTime(today.year, today.month, statementDay);
    if (today.isBefore(thisMonthStatement)) {
      return thisMonthStatement;
    } else {
      return DateTime(today.year, today.month + 1, statementDay);
    }
  }

  DateTime getPreviousPaymentDueDate(DateTime statementEndDate, int paymentDay) {
    final prevMonth = DateTime(statementEndDate.year, statementEndDate.month - 1);
    final daysInMonth = DateUtils.getDaysInMonth(prevMonth.year, prevMonth.month);
    final safeDay = paymentDay <= daysInMonth ? paymentDay : daysInMonth;
    return DateTime(prevMonth.year, prevMonth.month, safeDay);
  }

  DateTime get currentStatementDate => getCurrentStatementEndDate(DateTime.now(), widget.statementDay);
  DateTime get dueDate => getPreviousPaymentDueDate(currentStatementDate, widget.paymentDay);

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
            Text(
              "Monthly Summary",
              style: TextStyle(
                fontSize: Dimension.fontMedium,
                fontWeight: FontWeight.w700,
                color: Colors.teal.shade800
              ),
            ),
            Dimension.spacingMedium.height(),
            _buildSummaryRow(Icons.receipt_long, "Statement Date", currentStatementDate.format(pattern: "MMM dd, yyyy")),
            _buildSummaryRow(Icons.event, "Payment Due Date", dueDate.format(pattern: "MMM dd, yyyy")),
            _buildSummaryRow(Icons.account_balance_wallet, "Total Balance Due", widget.totalDue.toCurrency()),
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
          Icon(icon, size: 20, color: Colors.teal.shade800),
          Dimension.spacingSmall.width(),
          Expanded(
            child: Text(
              label, 
              style: TextStyle(
                fontSize: Dimension.fontSmall,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey.shade600
              ),                
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: Dimension.fontSmall,
              color: Colors.teal.shade800
            ),
          ),
        ],
      ),
    );
  }
}
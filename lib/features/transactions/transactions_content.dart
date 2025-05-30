import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/shared/constants/enums/date_filter_enum.dart';

import '../../app/styles/dimension.dart';
import 'components/summary_item.dart';
import 'components/transaction_item.dart';

class TransactionsContent extends StatefulWidget {
  const TransactionsContent({super.key});
  @override
  State<StatefulWidget> createState() => _TransactionsContentState();
}

class _TransactionsContentState extends State<TransactionsContent> {

  var _selectedDateFilter = DateFilterEnum.thisMonth;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.paddingMedium
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: Dimension.spacingExtraSmall,
              children: [
                ChoiceChip(
                  label: Text(
                    "This Month", 
                    style: TextStyle(
                      color: _selectedDateFilter == DateFilterEnum.thisMonth ? Colors.white :Colors.blueGrey, 
                      fontSize: Dimension.fontSmall
                    )
                  ),
                  selected: _selectedDateFilter == DateFilterEnum.thisMonth,
                  onSelected: (_) {
                    setState(() {
                      _selectedDateFilter = DateFilterEnum.thisMonth;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: _selectedDateFilter == DateFilterEnum.thisMonth ? Colors.teal.shade600 : Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  selectedColor: Colors.teal.shade600,
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: Dimension.paddingSmall
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.paddingSmall
                  )
                ),
                ChoiceChip(
                  label: Text(
                    "Last Month", 
                    style: TextStyle(
                      color: _selectedDateFilter == DateFilterEnum.lastMonth ? Colors.white :Colors.blueGrey, 
                      fontSize: Dimension.fontSmall
                    )
                  ),
                  selected: _selectedDateFilter == DateFilterEnum.lastMonth,
                  onSelected: (_) {
                    setState(() {
                      _selectedDateFilter = DateFilterEnum.lastMonth;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: _selectedDateFilter == DateFilterEnum.lastMonth ? Colors.teal.shade600 : Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  selectedColor: Colors.teal.shade600,
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: Dimension.paddingSmall
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.paddingSmall
                  )
                ),
                ChoiceChip(
                  label: Text(
                    "Custom Date", 
                    style: TextStyle(
                      color: _selectedDateFilter == DateFilterEnum.customDate ? Colors.white :Colors.blueGrey, 
                      fontSize: Dimension.fontSmall
                    )
                  ),
                  selected: _selectedDateFilter == DateFilterEnum.customDate,
                  onSelected: (_) {
                    setState(() {
                      _selectedDateFilter = DateFilterEnum.customDate;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: _selectedDateFilter == DateFilterEnum.customDate ? Colors.teal.shade600 : Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  selectedColor: Colors.teal.shade600,
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: Dimension.paddingSmall
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.paddingSmall
                  )
                ),
              ],
            ),
          ),
          Dimension.spacingLarge.height(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SummaryItem(title: 'Total Spent', value: '₱12,800'),
              SummaryItem(title: 'Transactions', value: '16')
            ],
          ),
          Dimension.spacingMedium.height(),
          Container(
            height: 1.0,
            color: Colors.teal.shade600,
            width: MediaQuery.sizeOf(context).width,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                bottom: Dimension.paddingTeraLarge,
                top: Dimension.paddingMedium
              ),
              children: [
                const SizedBox(height: 12),
                const Text('Today', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TransactionItem(
                  icon: Icons.fastfood,
                  title: 'Jollibee',
                  subtitle: '12:45 PM',
                  amount: '₱300',
                ),
                TransactionItem(
                  icon: Icons.shopping_bag,
                  title: 'Shopee',
                  subtitle: '10:15 AM',
                  amount: '₱1,200',
                ),
                const SizedBox(height: 16),
                const Text('May 29', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TransactionItem(
                  icon: Icons.local_gas_station,
                  title: 'Shell Gas',
                  subtitle: '6:05 PM',
                  amount: '₱2,000',
                ),
                const SizedBox(height: 16),
                const Text('May 28', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TransactionItem(
                  icon: Icons.local_gas_station,
                  title: 'Shell Gas',
                  subtitle: '6:05 PM',
                  amount: '₱2,000',
                ),
                TransactionItem(
                  icon: Icons.local_gas_station,
                  title: 'Shell Gas',
                  subtitle: '6:05 PM',
                  amount: '₱2,000',
                ),
                TransactionItem(
                  icon: Icons.local_gas_station,
                  title: 'Shell Gas',
                  subtitle: '6:05 PM',
                  amount: '₱2,000',
                ),
                TransactionItem(
                  icon: Icons.local_gas_station,
                  title: 'Shell Gas',
                  subtitle: '6:05 PM',
                  amount: '₱2,000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';

import '../../app/styles/dimension.dart';
import '../../shared/constants/enums/date_filter_enum.dart';
import 'components/credit_usage_bar.dart';

class InsightsContent extends StatefulWidget {
  const InsightsContent({super.key});
  @override
  State<StatefulWidget> createState() => _InsightsContentState();
}

class _InsightsContentState extends State<InsightsContent> {
  

  var _selectedDateFilter = DateFilterEnum.thisMonth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: Dimension.paddingMedium,
        right: Dimension.paddingMedium,
        bottom: Dimension.paddingMedium
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
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
                  ),
                ),
                Text(
                  "₱415/day on average",
                  style: TextStyle(
                    fontSize: Dimension.fontSmall,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.restaurant_menu, color: Colors.teal),
                    ),
                    Dimension.spacingSmall.width(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Food",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: Dimension.fontMedium,
                                    color: Colors.teal.shade800
                                  )
                                ),
                              ),
                              Text(
                                "10%",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey,
                                  fontSize: Dimension.fontSmall
                                ),
                              ),
                              Dimension.spacingSmall.width(),
                              Text(
                                1000.toCurrency(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal.shade800,
                                  fontSize: Dimension.fontMedium
                                ),
                              ),
                            ],
                          ),
                          Dimension.spacingSmall.height(),
                          LinearProgressIndicator(
                            value: 0.5,
                            color: Colors.teal.shade800,
                            backgroundColor: Colors.grey.shade300,
                            minHeight: 5.0,
                            borderRadius: BorderRadius.circular(Dimension.radiusMedium),
                          ),
                        ],
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
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(Dimension.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title, 
                  style: TextStyle(
                    fontSize: Dimension.fontMedium,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal.shade800
                  ),
                ),
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
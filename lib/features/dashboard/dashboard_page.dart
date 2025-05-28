import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';

import '../../app/styles/dimension.dart';
import '../../shared/widgets/common_scaffold.dart';
import 'bloc/dashboard_bloc.dart';
import 'components/cards_section.dart';
import 'components/monthly_summary_section.dart';
import 'components/recent_transactions_section.dart';

class DashboardPageWrapper extends StatelessWidget {
  const DashboardPageWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: Text(
          "Hello, Gastuser!",
          style: TextStyle(
            fontSize: Dimension.fontLarge,
            fontWeight: FontWeight.w400
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Dimension.spacingMedium.height(),
            CardsSection(),
            Dimension.spacingLarge.height(),
            MonthlySummarySection(
              statementDate: DateTime.now(),
              paymentDueDate: DateTime.now(),
              totalDue: 16000,
            ),
            Dimension.spacingLarge.height(),
            RecentTransactionsSection(),
            Dimension.spacingGigaLarge.height(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white)
      ),
    );
  }
}
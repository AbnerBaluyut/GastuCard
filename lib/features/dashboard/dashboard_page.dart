import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../app/routes/app_routes.dart';
import '../../app/styles/dimension.dart';
import '../../shared/widgets/common_scaffold.dart';
import '../insights/insights_content.dart';
import '../transactions/transactions_content.dart';
import 'bloc/dashboard_bloc.dart';
import '../cards/cards_content.dart';
import 'components/dashboard_appbar.dart';

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

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  var _tabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: DashboardAppBar(
        actionWidgets: [
          if (_tabIndex == 2) IconButton(
            onPressed: () {
              context.push(AppRoutes.addTransaction);
            }, 
            icon: Icon(Icons.add)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.settings)
          )
        ]
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CardsContent(),
              InsightsContent(),
              TransactionsContent(),
            ]
          ),
          Theme(
            data: ThemeData(
              tabBarTheme: TabBarTheme(
                overlayColor: WidgetStateColor.resolveWith(
                  (states) {
                    return Colors.transparent;
                  }
                ),
                splashFactory: InkRipple.splashFactory,
              )
            ),
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.only(
                left: Dimension.marginMedium,
                right: Dimension.marginMedium,
                bottom: Dimension.marginMedium
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0)
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.teal.shade700,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.all(Dimension.paddingSmall),
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    _tabIndex = index;
                  });
                },
                tabs: [
                  Tab(icon: Icon(Icons.credit_card), text: 'Cards'),
                  Tab(icon: Icon(Icons.bar_chart), text: 'Insights'),
                  Tab(icon: Icon(Icons.receipt_long), text: 'Transactions'),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}



import 'package:go_router/go_router.dart';

import '../../features/add_card/add_card_page.dart';
import '../../features/add_transaction/add_transaction_page.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/splash/splash_page.dart';
import 'app_routes.dart';

class AppRouter {

  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash, 
        builder: (context, state) {
          return const SplashPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.dashboard, 
        builder: (context, state) {
          return const DashboardPage();
        },
      ),
      GoRoute(
        path: AppRoutes.addTransaction, 
        builder: (context, state) {
          return const AddTransactionPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.addCard, 
        builder: (context, state) {
          return const AddCardPageWrapper();
        },
      ),
    ],
  );
}
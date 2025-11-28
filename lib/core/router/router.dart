import 'package:app/features/home/view.dart';
import 'package:app/features/init/view.dart';
import 'package:app/features/paywall/view.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: InitRoute.page, initial: true),
    AutoRoute(page: PaywallRoute.page),
    AutoRoute(page: HomeRoute.page),
  ];
}

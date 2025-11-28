import 'package:app/core/router/router.dart';
import 'package:app/data/repositories/secure_storage.dart';
import 'package:app/shared/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    checkSubscription();
  }

  Future checkSubscription() async {
    final storage = GetIt.I<SecureStorage>();
    final String? subscription = await storage.read(
      SecureStorageKey.subscribtion,
    );
    if (subscription != null) {
      final DateTime subscriptionDate = DateTime.parse(subscription);

      if (subscriptionDate.compareTo(DateTime.now()) > 0) {
        AutoRouter.of(context).push(HomeRoute());
        return;
      }
    }
    AutoRouter.of(context).push(PaywallRoute());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 96,
          width: 96,
          child: CircularProgressIndicator(color: theme.custom.primaryColor),
        ),
      ),
    );
  }
}

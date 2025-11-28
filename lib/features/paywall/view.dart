import 'package:app/features/paywall/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@RoutePage()
class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaywallAppBar(),
      body: PaywallInfo(),
      floatingActionButton: PaywallOpenPayButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

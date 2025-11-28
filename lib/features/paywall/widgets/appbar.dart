import 'package:app/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class PaywallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PaywallAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.custom.primaryBackground,
      surfaceTintColor: theme.custom.primaryBackground,
    );
  }
}

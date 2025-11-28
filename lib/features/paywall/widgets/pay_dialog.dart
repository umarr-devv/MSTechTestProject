import 'package:app/core/router/router.dart';
import 'package:app/data/repositories/repositories.dart';
import 'package:app/shared/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PatwallPayDialog extends StatefulWidget {
  const PatwallPayDialog({super.key});

  Future show(BuildContext context) async {
    final theme = Theme.of(context);
    await showModalBottomSheet(
      context: context,
      backgroundColor: theme.custom.primaryBackground,
      builder: (context) => this,
    );
  }

  @override
  State<PatwallPayDialog> createState() => _PatwallPayDialogState();
}

class _PatwallPayDialogState extends State<PatwallPayDialog> {
  int activeIndex = 0;

  void onSelect(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
      decoration: BoxDecoration(color: theme.custom.primaryBackground),
      child: Column(
        children: [
          Column(
            spacing: 16,
            children: [
              _SelectTarif(
                price: 30,
                label: 'Month',
                duration: Duration(days: 28),
                discount: 0,
                activeIndex: activeIndex,
                index: 0,
                onSelect: onSelect,
              ),
              _SelectTarif(
                price: 360,
                label: 'Year',
                duration: Duration(days: 365),
                discount: 10,
                activeIndex: activeIndex,
                index: 1,
                onSelect: onSelect,
              ),
            ],
          ),
          const SizedBox(height: 96),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                final storage = GetIt.I<SecureStorage>();
                await storage.write(
                  SecureStorageKey.subscribtion,
                  DateTime.now()
                      .add(Duration(days: activeIndex == 0 ? 28 : 365))
                      .toIso8601String(),
                );
                // ignore: use_build_context_synchronously
                AutoRouter.of(context).push(HomeRoute());
              },
              style: TextButton.styleFrom(
                backgroundColor: theme.custom.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: Text(
                'Принять',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectTarif extends StatefulWidget {
  const _SelectTarif({
    required this.activeIndex,
    required this.index,
    required this.onSelect,
    required this.price,
    required this.label,
    required this.duration,
    required this.discount,
  });
  final int activeIndex;
  final int index;
  final Function(int) onSelect;
  final double price;
  final String label;
  final Duration duration;
  final double discount;

  @override
  State<_SelectTarif> createState() => _SelectTarifState();
}

class _SelectTarifState extends State<_SelectTarif> {
  bool get active => widget.activeIndex == widget.index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onSelect(widget.index);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: theme.custom.secondaryForeground.withValues(alpha: 0.25),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          spacing: 16,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  color: active
                      ? theme.custom.primaryColor
                      : theme.custom.secondaryForeground.withValues(
                          alpha: 0.25,
                        ),
                ),
                borderRadius: BorderRadius.circular(64),
                color: active ? theme.custom.primaryColor : Colors.transparent,
              ),
              child: active
                  ? Icon(Icons.check, size: 20, color: Colors.white)
                  : SizedBox(),
            ),
            Expanded(child: Text(widget.label)),
            if (widget.discount != 0)
              Row(
                spacing: 8,
                children: [
                  Text(
                    '${(widget.price * (100 - widget.discount) / 100).toStringAsFixed(2)}\$',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: theme.custom.primaryColor,
                    ),
                  ),
                  Text(
                    '${widget.price.toStringAsFixed(2)}\$',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: theme.custom.primaryColor,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 4,
                      decorationColor: theme.custom.secondaryForeground
                          .withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            if (widget.discount == 0)
              Text(
                '${widget.price.toStringAsFixed(2)}\$',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.custom.primaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

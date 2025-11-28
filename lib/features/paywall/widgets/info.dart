import 'package:app/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class PaywallInfo extends StatelessWidget {
  const PaywallInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_InfoIcon(), _InfoTitle(), _InfoColumns()],
      ),
    );
  }
}

class _InfoColumns extends StatelessWidget {
  const _InfoColumns();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        _InfoColumnItem(
          icon: Icons.file_copy,
          title: 'Gain clients',
          label: 'with ease through open house visitors',
        ),
        _InfoColumnItem(
          icon: Icons.web,
          title: 'Build expose',
          label: 'through personilized website',
        ),
        _InfoColumnItem(
          icon: Icons.access_time_rounded,
          title: 'Expedite deal clousere',
          label: 'with AI-crafted',
        ),
      ],
    );
  }
}

class _InfoColumnItem extends StatelessWidget {
  const _InfoColumnItem({
    required this.icon,
    required this.title,
    required this.label,
  });

  final IconData icon;
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 12,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: theme.custom.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: theme.custom.primaryColor),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: theme.custom.secondaryForeground,
              ),
              children: [
                TextSpan(
                  text: '$title ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: theme.custom.primaryForeground,
                  ),
                ),
                TextSpan(text: label),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoTitle extends StatelessWidget {
  const _InfoTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Boost your real estate success',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: theme.custom.secondaryForeground,
      ),
    );
  }
}

class _InfoIcon extends StatelessWidget {
  const _InfoIcon();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: theme.custom.primaryColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.diamond_outlined,
            size: 20,
            color: theme.custom.primaryColor,
          ),
          Text(
            'Try premium',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: theme.custom.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

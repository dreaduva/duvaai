import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class QuickAccessSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Access',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _QuickAccessButton(
              icon: UIcons.solidRounded.loading,
              label: 'Tasks',
              onTap: () {},
            ),
            const SizedBox(width: 8),
            _QuickAccessButton(
              icon: Icons.bar_chart,
              label: 'Analytics',
              onTap: () {},
            ),
            const SizedBox(width: 8),
            _QuickAccessButton(
              icon: UIcons.solidRounded.lightbulb_dollar,
              label: 'Tips',
              onTap: () {},
            ),
            const SizedBox(width: 8),
            _QuickAccessButton(
              icon: UIcons.solidRounded.shop,
              label: 'Company',
              onTap: () {},
            ),
            const SizedBox(width: 8),
            _QuickAccessButton(
              icon: UIcons.solidRounded.menu_dots,
              label: 'More',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAccessButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.surfaceContainerHighest),
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 40,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant, // Match the white text color
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
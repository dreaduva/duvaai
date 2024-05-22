import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // Import the responsive_sizer plugin
import 'package:uicons/uicons.dart';

class QuickAccessSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Access',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 16.sp),
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _QuickAccessButton(
              icon: UIcons.solidRounded.loading,
              label: 'Tasks',
              onTap: () {},
            ),
            SizedBox(width: 2.w),
            _QuickAccessButton(
              icon: Icons.bar_chart,
              label: 'Analytics',
              onTap: () {},
            ),
            SizedBox(width: 2.w),
            _QuickAccessButton(
              icon: UIcons.solidRounded.lightbulb_dollar,
              label: 'Tips',
              onTap: () {},
            ),
            SizedBox(width: 2.w),
            _QuickAccessButton(
              icon: UIcons.solidRounded.shop,
              label: 'Company',
              onTap: () {},
            ),
            SizedBox(width: 2.w),
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
            padding:
                EdgeInsets.all(3.w), // Adjusted padding using responsive_sizer
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.surfaceContainerHighest),
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 8.w, // Adjusted icon size using responsive_sizer
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 1.h), // Adjusted height using responsive_sizer
          Text(
            label,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontSize: 14.sp, // Adjusted font size using responsive_sizer
            ),
          ),
        ],
      ),
    );
  }
}

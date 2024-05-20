import 'package:flutter/material.dart';
import 'package:duvaai/common/utils/constants.dart';

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(context, '200', 'Comments', Icons.comment),
                const SizedBox(width: paddingSmall),
                _buildStatCard(context, '10', 'Reviews', Icons.star),
                const SizedBox(width: paddingSmall),
                _buildStatCard(context, '10', 'Reviews', Icons.star),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
      BuildContext context, String count, String label, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.surfaceContainerHighest),
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 190,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: colorScheme.onSurface,
                ),
                const Spacer(),
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'THIS WEEK',
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

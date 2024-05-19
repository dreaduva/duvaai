import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duvaai/controllers/dashboard_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final DashboardController _navController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 12,
      child: SizedBox(
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                _buildNavItem(context, Icons.dashboard, 'Home', 0),
                _buildNavItem(context, Icons.analytics, 'Analytics', 1),
              ],
            ),
            Row(
              children: [
                _buildNavItem(
                    context, Icons.tips_and_updates_outlined, 'Tips', 2),
                _buildNavItem(context, Icons.settings, 'Settings', 3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, String label, int index) {
    final theme = Theme.of(context).colorScheme;

    return Obx(() {
      return MaterialButton(
        minWidth: 40,
        onPressed: () => _navController.onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _navController.selectedIndex.value == index
                  ? theme.primary
                  : theme.onSurface,
            ),
            Text(
              label,
              style: TextStyle(
                color: _navController.selectedIndex.value == index
                    ? theme.primary
                    : theme.onSurface,
              ),
            ),
          ],
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // Import the responsive_sizer plugin
import 'package:duvaai/controllers/dashboard_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final DashboardController _navController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 1.5.w, // Adjusted notch margin using responsive_sizer
      child: SizedBox(
        height: 10.h, // Adjusted height using responsive_sizer
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
        minWidth: 10.w, // Adjusted min width using responsive_sizer
        onPressed: () => _navController.onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 3.h, // Adjusted icon size using responsive_sizer
              color: _navController.selectedIndex.value == index
                  ? theme.primary
                  : theme.onSurface,
            ),
            SizedBox(height: 0.5.h), // Adjusted spacing using responsive_sizer
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp, // Adjusted font size using responsive_sizer
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

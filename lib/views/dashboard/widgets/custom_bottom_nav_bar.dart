import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:duvaai/controllers/dashboard_controller.dart';
import 'package:uicons/uicons.dart';

class CustomBottomNavBar extends StatelessWidget {
  final DashboardController _navController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      height: 8.h,
      shape: const CircularNotchedRectangle(),
      notchMargin: 2.h, // Adjusted notch margin using responsive_sizer
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                _buildNavItem(context, UIcons.solidRounded.home,
                    UIcons.regularRounded.home, 'Home', 0),
                _buildNavItem(context, UIcons.solidRounded.star,
                    UIcons.regularRounded.star, 'Tips', 1),
              ],
            ),
            Row(
              children: [
                _buildNavItem(context, UIcons.solidRounded.bars_progress,
                    UIcons.regularRounded.bars_progress, 'Analytics', 2),
                _buildNavItem(context, UIcons.solidRounded.settings,
                    UIcons.regularRounded.settings, 'Settings', 3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData solidIcon,
      IconData regularIcon, String label, int index) {
    final theme = Theme.of(context).colorScheme;

    return Obx(() {
      final bool isSelected = _navController.selectedIndex.value == index;
      return MaterialButton(
        minWidth: 4.w, // Adjusted min width using responsive_sizer
        onPressed: () => _navController.onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? solidIcon : regularIcon,
              size: 2.5.h, // Adjusted icon size using responsive_sizer
              color: isSelected ? theme.primary : theme.onSurface,
            ),
            SizedBox(height: 0.3.h), // Adjusted spacing using responsive_sizer
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp, // Adjusted font size using responsive_sizer
                color: isSelected ? theme.primary : theme.onSurface,
              ),
            ),
          ],
        ),
      );
    });
  }
}

import 'package:duvaai/common/utils/constants.dart';
import 'package:duvaai/controllers/dashboard_controller.dart';

import 'package:duvaai/views/dashboard/widgets/widgets/fab_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  final DashboardController _navController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 20,
      child: ClipPath(
        clipper: FabClipper(notchRadius: 20),
        child: SizedBox(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  _buildNavItem(Icons.dashboard, 'Home', 0),
                  _buildNavItem(Icons.analytics, 'Analytics', 1),
                ],
              ),
              Row(
                children: [
                  _buildNavItem(Icons.tips_and_updates_outlined, 'Tips', 2),
                  _buildNavItem(Icons.settings, 'Settings', 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
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
                  ? primaryColor
                  : onSecondaryColor,
            ),
            Text(
              label,
              style: TextStyle(
                color: _navController.selectedIndex.value == index
                    ? primaryColor
                    : onSecondaryColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}

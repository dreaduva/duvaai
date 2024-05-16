
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';
import '../../core/routes/app_routes.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController _dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _dashboardController.signOut(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Duva Ai, ${_dashboardController.user?.email}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Quick Access',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _DashboardButton(
                  icon: Icons.facebook,
                  label: 'Facebook Posts',
                  onTap: () => Get.toNamed(AppRoutes.facebookPost),
                ),
                _DashboardButton(
                  icon: Icons.account_balance_rounded,
                  label: 'Instagram Posts',
                  onTap: () => Get.toNamed(AppRoutes.instagramPost),
                ),
                _DashboardButton(
                  icon: Icons.reviews,
                  label: 'Google Reviews',
                  onTap: () => Get.toNamed(AppRoutes.googleReviews),
                ),
              ],
            ),
            // Add more widgets and features here as needed
          ],
        ),
      ),
    );
  }
}

class _DashboardButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DashboardButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

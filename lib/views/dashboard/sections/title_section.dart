import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../core/theme/app_theme.dart';

class TitleSection extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Duva Ai', style: AppTheme.headlineLarge(context)),
                Text(
                  'Hi, ${dashboardController.user?.displayName ?? ''}!',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                  dashboardController.user?.photoURL ??
                      'assets/images/profile.png',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duvaai/controllers/dashboard_controller.dart';
import 'package:duvaai/controllers/theme_controller.dart';
import 'package:duvaai/core/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uicons/uicons.dart';

class DashboardDrawer extends StatelessWidget {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();
  final ThemeController _themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppTheme.primaryContainer(context),
            ),
            accountName: Text(
              _dashboardController.user?.displayName ?? 'Guest',
              style: AppTheme.bodyMedium(context),
            ),
            accountEmail: Text(
              _dashboardController.user?.email ?? '',
              style: AppTheme.bodyMedium(context),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                _dashboardController.user?.photoURL ??
                    'assets/images/profile.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Change Location'),
            ),
          ),
          ListTile(
            leading: Icon(UIcons.regularRounded.sign_out_alt),
            title: Text(
              'Sign Out',
              style: AppTheme.bodyMedium(context),
            ),
            onTap: () => _dashboardController.signOut(),
          ),
          ListTile(
            leading: Obx(() => Icon(
                  _themeController.isDarkTheme.value
                      ? UIcons.regularRounded.sun
                      : UIcons.regularRounded.moon,
                )),
            title: const Text('Toggle Theme'),
            onTap: () => _themeController.toggleTheme(),
          ),
        ],
      ),
    );
  }
}

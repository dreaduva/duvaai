import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../core/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      toolbarHeight: 4.h,
      actions: [
        GestureDetector(
          onTap: () => Scaffold.of(context).openEndDrawer(),
          child: CircleAvatar(
            radius: 5.w,
            backgroundImage: NetworkImage(
              dashboardController.user?.photoURL ?? 'assets/images/profile.png',
            ),
          ),
        ),
        SizedBox(width: 4.w)
      ],
      title: Text('Duva Ai', style: AppTheme.titleLarge(context)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(4.5.h);
}

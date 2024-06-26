import 'package:duvaai/common/utils/constants.dart';
import 'package:duvaai/views/dashboard/chat_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:duvaai/views/dashboard/sections/automations_section.dart';
import 'package:duvaai/views/dashboard/sections/quick_access_section.dart';
import 'package:duvaai/views/dashboard/sections/stats_section.dart';
import 'package:duvaai/views/dashboard/sections/app_bar.dart';
import 'package:duvaai/views/dashboard/widgets/custom_bottom_nav_bar.dart';
import 'package:duvaai/views/dashboard/drawer/drawer.dart';
import 'package:duvaai/controllers/dashboard_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      endDrawer: DashboardDrawer(),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatsSection(),
            QuickAccessSection(),
            const SizedBox(height: paddingSmall),
            const Divider(),
            const SizedBox(height: paddingSmall),
            AutomationsSection(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Colors.transparent, // Ensure the FAB itself is transparent
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
            //constraints: BoxConstraints.expand(),
            context: context,
            isScrollControlled: true,
            builder: (context) => ChatBottomSheet(),
          );
        },
        child: SvgPicture.asset(
          'assets/images/duva_ai_edited.svg',
          //color: Colors.green,
          width: 10.w,
          height: 10.h,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

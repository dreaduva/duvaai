import 'package:duvaai/common/utils/constants.dart';
import 'package:duvaai/views/dashboard/widgets/automation_card.dart';
import 'package:duvaai/views/dashboard/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _dashboardController.signOut(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingSection(context),
            const SizedBox(height: paddingMedium),
            _buildQuickAccessSection(context),
            const SizedBox(height: paddingMedium),
            _buildAutomationsSection(context),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        tooltip: 'Standard',
        child: const Icon(Icons.chat_bubble_outlined),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget _buildGreetingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'welcome ${_dashboardController.user?.displayName ?? ''}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: paddingSmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStatCard(context, '200', 'Comments', Icons.comment),
            _buildStatCard(context, '10', 'reviews'.tr, Icons.star),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
      BuildContext context, String count, String label, IconData icon) {
    return Card(
      elevation: 2,
      color: surfaceVariantColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(paddingMedium),
        child: Column(
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: paddingSmall),
            Text(
              count,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: paddingSmall),
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Access',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: paddingSmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _QuickAccessButton(
              icon: Icons.task,
              label: 'Tasks',
              onTap: () {},
            ),
            _QuickAccessButton(
              icon: Icons.analytics,
              label: 'Analytics',
              onTap: () {},
            ),
            _QuickAccessButton(
              icon: Icons.lightbulb,
              label: 'Tips',
              onTap: () {},
            ),
            _QuickAccessButton(
              icon: Icons.person,
              label: 'Profile',
              onTap: () {},
            ),
            _QuickAccessButton(
              icon: Icons.more_horiz,
              label: 'More',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAutomationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Automations for your Business',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: paddingMedium),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: paddingSmall,
          mainAxisSpacing: paddingSmall,
          children: const [
            AutomationCard(
              iconData: Icons.facebook,
              title: 'Facebook',
              subtitle: 'Posts Calendar',
              isActive: true,
            ),
            AutomationCard(
              iconData: Icons.camera,
              title: 'Instagram',
              subtitle: 'Posts Calendar',
            ),
            AutomationCard(
              iconData: Icons.star,
              title: 'Google Reviews',
              subtitle: 'Review Replies',
            ),
            AutomationCard(
              iconData: Icons.search,
              title: 'SEO Analysis',
              subtitle: 'Rank Higher',
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAccessButton({
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
          const SizedBox(height: paddingSmall),
          Text(label),
        ],
      ),
    );
  }
}

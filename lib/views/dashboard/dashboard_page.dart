import 'package:duvaai/common/utils/constants.dart';
import 'package:duvaai/controllers/theme_controller.dart';
import 'package:duvaai/core/theme/app_theme.dart';
import 'package:duvaai/views/dashboard/widgets/automation_card.dart';
import 'package:duvaai/views/dashboard/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController _dashboardController =
      Get.put(DashboardController());
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      endDrawer: drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(paddingMedium),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ElevatedButton(
              //   onPressed: () =>
              //       Get.find<GoogleReviewsController>().fetchReviews(),
              //   child: const Text('Fetch Reviews'),
              // ),
              _buildTitleSection(context),
              _buildStatsSection(context),
              _buildQuickAccessSection(context),
              const SizedBox(height: paddingSmall), const Divider(),
              const SizedBox(height: paddingSmall),
              _buildAutomationsSection(context),
            ],
          ),
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

  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Anna',
              style: AppTheme.bodyMedium(context),
            ),
            accountEmail:
                Text('anna@example.com', style: AppTheme.bodyMedium(context)),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profile.png'), // Replace with actual image
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Sign Out',
              style: AppTheme.bodyMedium(context),
            ),
            onTap: () => _dashboardController.signOut(),
          ),
          ListTile(
            leading: Obx(() => Icon(
                  _themeController.isDarkTheme.value
                      ? Icons.light_mode
                      : Icons.dark_mode,
                )),
            title: const Text('Toggle Theme'),
            onTap: () => _themeController.toggleTheme(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(context, '200', 'Comments', Icons.comment),
                const SizedBox(width: paddingSmall),
                _buildStatCard(context, '10', 'Reviews'.tr, Icons.star),
                const SizedBox(width: paddingSmall),
                _buildStatCard(context, '10', 'Reviews'.tr, Icons.star),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
      BuildContext context, String count, String label, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.surfaceContainerHighest),
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 190,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: colorScheme.onSurface,
                ),
                const Spacer(),
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'THIS WEEK',
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildQuickAccessSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Quick Access',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(height: paddingSmall),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _QuickAccessButton(
            icon: Icons.task_alt_sharp,
            label: 'Tasks',
            onTap: () {},
          ),
          const SizedBox(width: paddingSmall),
          _QuickAccessButton(
            icon: Icons.bar_chart,
            label: 'Analytics',
            onTap: () {},
          ),
          const SizedBox(width: paddingSmall),
          _QuickAccessButton(
            icon: Icons.lightbulb,
            label: 'Tips',
            onTap: () {},
          ),
          const SizedBox(width: paddingSmall),
          _QuickAccessButton(
            icon: Icons.person,
            label: 'Profile',
            onTap: () {},
          ),
          const SizedBox(width: paddingSmall),
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
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'AI',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'tomations for your Business',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      const SizedBox(height: paddingMedium),
      GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: paddingSmall,
        mainAxisSpacing: paddingSmall,
        children: const [
          AutomationCard(
            iconData: Icons.facebook,
            title: 'Facebook',
            subtitle: 'Posts Calendar',
            infoMessage: 'Create and post content for you daily on Facebook',
            isActive: true,
          ),
          AutomationCard(
            iconData: Icons.camera,
            title: 'Instagram',
            subtitle: 'Posts Calendar',
            infoMessage: 'Instagram, create and post content for you daily',
          ),
          AutomationCard(
            iconData: Icons.star,
            title: 'Google Reviews',
            subtitle: 'Review Replies',
            infoMessage: 'Reply professionaly to your reviews',
          ),
          AutomationCard(
            iconData: Icons.public_rounded,
            title: 'SEO Analysis',
            subtitle: 'Rank Higher',
            infoMessage:
                'Optimise you business page so that you can rank high on google',
          ),
        ],
      ),
    ],
  );
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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.surfaceContainerHighest),
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 40,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant, // Match the white text color
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTitleSection(BuildContext context) {
  final DashboardController dashboardController =
      Get.put(DashboardController());
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
            child: const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ],
      );
    },
  );
}

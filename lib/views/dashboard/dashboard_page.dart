import 'package:duvaai/common/utils/constants.dart';
import 'package:duvaai/controllers/automations/google/google_reviews_controller.dart';
import 'package:duvaai/controllers/theme_controller.dart';
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
  final GoogleReviewsController _googleReviewsController =
      Get.put(GoogleReviewsController());
  final ThemeController _themeController = Get.put(ThemeController());

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
          IconButton(
            icon: Obx(() => Icon(
                  _themeController.isDarkTheme.value
                      ? Icons.dark_mode
                      : Icons.light_mode,
                )),
            onPressed: () => _themeController.toggleTheme(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Get.find<GoogleReviewsController>().fetchReviews(),
              child: const Text('Fetch Reviews'),
            ),
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
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: paddingSmall),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard(context, '200', 'Comments', Icons.comment),
              const SizedBox(width: paddingSmall),
              _buildStatCard(context, '10', 'reviews'.tr, Icons.star),
              const SizedBox(width: paddingSmall),
              _buildStatCard(context, '10', 'reviews'.tr, Icons.star),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
      BuildContext context, String count, String label, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      color: Theme.of(context).cardTheme.color ?? Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.surfaceContainerHighest),
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 180,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Colors.white),
                const Spacer(),
                Text(
                  count,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.white),
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
        style: Theme.of(context).textTheme.titleLarge,
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
        'AItomations for your Business',
        style: Theme.of(context).textTheme.titleLarge,
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
            padding: const EdgeInsets.all(16),
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

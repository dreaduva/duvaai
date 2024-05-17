// lib/views/dashboard/dashboard_page.dart
import 'package:duvaai/common/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController _dashboardController = Get.put(DashboardController());
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
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
            SizedBox(height: paddingMedium),
            _buildQuickAccessSection(context),
            SizedBox(height: paddingMedium),
            _buildAutomationsSection(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildGreetingSection(BuildContext context) {
    final userName = 'Anna'; // Replace with the actual user's name
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'welcome'.trParams({'name': userName}),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: paddingSmall),
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

  Widget _buildStatCard(BuildContext context, String count, String label, IconData icon) {
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
            SizedBox(height: paddingSmall),
            Text(
              count,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: paddingSmall),
            Text(
              label,
              style: TextStyle(fontSize: 16),
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
        Text(
          'Quick Access',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: paddingSmall),
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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: paddingSmall),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: paddingMedium,
          mainAxisSpacing: paddingMedium,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _AutomationCard(
              title: 'Facebook Posts Calendar',
              icon: Icons.facebook,
              isActive: true,
              onTap: () => Get.toNamed('/facebookPost'),
            ),
            _AutomationCard(
              title: 'Instagram Posts Calendar',
              icon: Icons.camera_alt,
              isActive: false,
              onTap: () => Get.toNamed('/instagramPost'),
            ),
            _AutomationCard(
              title: 'Google Reviews',
              icon: Icons.reviews,
              isActive: false,
              onTap: () => (Get.toNamed('/googleReviews')),
            ),
            _AutomationCard(
              title: 'SEO Analysis',
              icon: Icons.analytics,
              isActive: false,
              onTap: () {},
            ),
            Container(
              padding: const EdgeInsets.all(paddingMedium),
              child: Center(
                child: Text(
                  'More awesome automations coming soon!',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
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
          SizedBox(height: paddingSmall),
          Text(label),
        ],
      ),
    );
  }
}

class _AutomationCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _AutomationCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        color: isActive ? primaryColor : surfaceVariantColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 40, color: isActive ? onPrimaryColor : onSecondaryColor),
              SizedBox(height: paddingSmall),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, color: isActive ? onPrimaryColor : onSecondaryColor),
                ),
              ),
              if (isActive)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.check_circle, color: Colors.green),
                )
              else
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.info, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

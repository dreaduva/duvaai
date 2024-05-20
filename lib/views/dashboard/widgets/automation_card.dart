import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutomationCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final String infoMessage;
  final bool isActive;

  const AutomationCard({
    Key? key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.infoMessage,
    this.isActive = false,
  }) : super(key: key);

  void _showInfoDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Info'),
        content: Text(infoMessage),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 1,
      color: colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: isActive
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          width: isActive ? 2.0 : 1.0,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(iconData,
                    color:
                        isActive ? colorScheme.onSurface : colorScheme.outline,
                    size: 40),
                const SizedBox(height: 48.0),
                Text(
                  title,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20.0,
            right: 16.0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: _showInfoDialog,
                  child: Icon(
                    Icons.info,
                    color: colorScheme.outline,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isActive
                          ? colorScheme.primaryContainer
                          : colorScheme.outline,
                      width: isActive ? 2.0 : 1,
                    ),
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    isActive ? 'Active' : 'Inactive',
                    style: TextStyle(
                      color: isActive
                          ? colorScheme.inversePrimary
                          : colorScheme.outline,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

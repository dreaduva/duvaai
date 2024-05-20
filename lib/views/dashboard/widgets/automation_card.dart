import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // Import the responsive_sizer plugin

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
            padding:
                EdgeInsets.all(4.w), // Adjusted padding using responsive_sizer
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  iconData,
                  color: isActive ? colorScheme.onSurface : colorScheme.outline,
                  size: 9.w, // Adjusted icon size using responsive_sizer
                ),
                SizedBox(height: 5.h), // Adjusted height using responsive_sizer
                Text(
                  title,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize:
                        16.sp, // Adjusted font size using responsive_sizer
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize:
                        16.sp, // Adjusted font size using responsive_sizer
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5.5.w, // Adjusted position using responsive_sizer
            right: 4.w, // Adjusted position using responsive_sizer
            child: Row(
              children: [
                GestureDetector(
                  onTap: _showInfoDialog,
                  child: Icon(
                    Icons.info,
                    color: colorScheme.outline,
                    size: 5.w, // Adjusted icon size using responsive_sizer
                  ),
                ),
                SizedBox(width: 2.w), // Adjusted width using responsive_sizer
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 1.5.w,
                      vertical:
                          0.5.h), // Adjusted padding using responsive_sizer
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
                    isActive
                        ? 'Active'.toUpperCase()
                        : 'Inactive'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12.sp,
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

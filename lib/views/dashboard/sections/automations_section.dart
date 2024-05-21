import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uicons/uicons.dart';
import '../widgets/automation_card.dart';

class AutomationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: 16),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            const AutomationCard(
              iconData: Ionicons.logo_facebook,
              iconColor: Colors.blue,
              title: 'Facebook',
              subtitle: 'Posts Calendar',
              infoMessage: 'Create and post content for you daily on Facebook',
              isActive: true,
            ),
            const AutomationCard(
              iconColor: Colors.pink,
              iconData: Ionicons.logo_instagram,
              title: 'Instagram',
              subtitle: 'Posts Calendar',
              infoMessage: 'Instagram, create and post content for you daily',
              isActive: false,
            ),
            const AutomationCard(
              iconColor: Colors.white,
              iconData: Ionicons.logo_google,
              title: 'Google Reviews',
              subtitle: 'Review Replies',
              infoMessage: 'Reply professionally to your reviews',
            ),
            AutomationCard(
              iconColor: Colors.white,
              iconData: UIcons.solidRounded.bullseye_pointer,
              title: 'SEO Analysis',
              subtitle: 'Rank Higher',
              infoMessage: 'Optimize your business page to rank high on Google',
            ),
          ],
        ),
      ],
    );
  }
}

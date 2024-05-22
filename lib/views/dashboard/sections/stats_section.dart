import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // Import the responsive_sizer plugin
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uicons/uicons.dart';

class StatsSection extends StatefulWidget {
  @override
  _StatsSectionState createState() => _StatsSectionState();
}

class _StatsSectionState extends State<StatsSection> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 16.h, // Adjusted height to fit two cards in view
          child: PageView.builder(
            controller: _pageController,
            itemCount: 2, // Number of items in the carousel
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Row(
                    children: [
                      _buildStatCard(context, '200', 'Comments',
                          UIcons.solidRounded.comments, Colors.blue),
                      _buildStatCard(context, '10', 'Reviews',
                          UIcons.solidRounded.stars, Colors.yellow[700]!),
                    ],
                  );
                case 1:
                  return Row(
                    children: [
                      _buildStatCard(
                          context, '10', 'Likes', Icons.thumb_up, Colors.green),
                      _buildStatCard(context, '15', 'Shares',
                          UIcons.solidRounded.share, Colors.purple),
                    ],
                  );
                default:
                  return Container();
              }
            },
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: ScrollingDotsEffect(
              dotHeight: 1.h,
              dotWidth: 1.h,
              activeDotColor: Colors.green,
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String count, String label,
      IconData icon, Color iconColor) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 1.w), // Adjusted padding between cards
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.surfaceContainerHighest),
            color: colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          height: 10.h,
          width: 41.8.w, // Adjusted width using responsive_sizer
          padding:
              EdgeInsets.all(2.w), // Adjusted padding using responsive_sizer
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    count,
                    style: TextStyle(
                      fontSize:
                          19.sp, // Adjusted font size using responsive_sizer
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    icon,
                    size: 7.w, // Adjusted icon size using responsive_sizer
                    color: iconColor, // Use the iconColor parameter
                  ),
                ],
              ),
              SizedBox(height: 0.5.h), // Adjusted height using responsive_sizer
              Text(
                label,
                style: TextStyle(
                  fontSize: 15.sp, // Adjusted font size using responsive_sizer
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 0.1.h), // Adjusted height using responsive_sizer
              Text(
                'THIS WEEK',
                style: TextStyle(fontSize: 12.sp, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

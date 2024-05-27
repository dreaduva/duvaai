import 'package:duvaai/controllers/dashboard_controller.dart';
import 'package:duvaai/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uicons/uicons.dart';

enum ReviewStatus { posted, scheduled, confirmation }

class GoogleReviewPage extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppTheme.titleLarge(context).color,
        backgroundColor: AppTheme.surface(context),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              UIcons.regularRounded.settings_sliders,
            ),
          ),
        ],
        title: Row(
          children: [
            Icon(Ionicons.logo_google, size: 12.w),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Replies',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  'Google Reviews',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ],
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
        children: [
          Stack(
            children: [
              Column(
                children: [
                  _buildReviewCard(
                    context,
                    time: '07:00 AM',
                    status: ReviewStatus.posted,
                    content:
                        "Restaurant was very nice. Food very tasty. Will come again 🙂",
                    date: '01/02/2024',
                    userName: 'Leo',
                    userImage: 'assets/images/profile.png',
                    rating: 5,
                  ),
                  _buildConnector(), // Add the connector between review and reply
                  _buildReplyCard(
                    context,
                    replyContent:
                        "Thank You Leo for your Review, we are pleased to see that you liked by us!",
                    date: '01/02/2024',
                    responderName: 'Anna',
                    responderImage: 'assets/images/profile.png',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(
    BuildContext context, {
    required String time,
    required ReviewStatus status,
    required String content,
    required String date,
    required String userName,
    required String userImage,
    required int rating,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 6.h, 0, 1.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Container(
              constraints: BoxConstraints(minHeight: 20.h),
              padding: EdgeInsets.all(2.h),
              margin: EdgeInsets.only(top: 2.h),
              decoration: BoxDecoration(
                color: AppTheme.surfaceContainerHighest(context),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h),
                  Text(
                    content,
                    style: GoogleFonts.roboto(
                      color: colorScheme.onSurface,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -4.h,
            left: 10.w,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 5.w,
                  backgroundImage: AssetImage(userImage),
                ),
                SizedBox(width: 2.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: AppTheme.bodyLarge(context),
                    ),
                    Row(
                      children: List.generate(
                        rating,
                        (index) => Icon(Icons.star, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 6.h,
            left: -1.w,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                date,
                style: GoogleFonts.roboto(
                  color: colorScheme.onSurface,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                time,
                style: GoogleFonts.roboto(
                  color: Colors.green,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyCard(
    BuildContext context, {
    required String replyContent,
    required String date,
    required String responderName,
    required String responderImage,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Container(
            constraints: BoxConstraints(minHeight: 24.h),
            padding: EdgeInsets.all(3.w),
            margin: EdgeInsets.only(top: 2.h),
            decoration: BoxDecoration(
              color: AppTheme.onTertiary(context),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REPLY',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: AppTheme.onSurface(context),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    replyContent,
                    style: GoogleFonts.roboto(
                      color: colorScheme.onSurface,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(), // Use Spacer to push the avatar and actions to the bottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 5.w,
                            backgroundImage: NetworkImage(
                              dashboardController.user?.photoURL ??
                                  'assets/images/profile.png',
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            dashboardController.user!.displayName
                                    ?.toUpperCase() ??
                                'User',
                            style: GoogleFonts.roboto(
                              color: colorScheme.onSurface,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: _buildReplyActions(colorScheme),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 8.h,
          left: -1.w,
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              date,
              style: GoogleFonts.roboto(
                color: colorScheme.onSurface,
                fontSize: 17.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConnector() {
    return Container(
      height: 5.h, // Adjust the height as needed to connect the cards
      width: 2,
      color: Colors.grey, // Set the color for the connector
    );
  }

  List<Widget> _buildReplyActions(ColorScheme colorScheme) {
    return [
      IconButton(
        icon: Icon(UIcons.regularRounded.edit, color: colorScheme.onSurface),
        onPressed: () {
          // Add edit functionality
        },
      ),
      IconButton(
        icon: Icon(UIcons.regularRounded.trash, color: colorScheme.onSurface),
        onPressed: () {
          // Add delete functionality
        },
      ),
    ];
  }
}

import 'package:duvaai/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uicons/uicons.dart';

enum PostStatus { posted, scheduled, confirmation }

class FacebookPostPage extends StatelessWidget {
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
            Icon(Ionicons.logo_facebook, size: 12.w),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Post Calendar',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  'Facebook',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ],
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(2.w, 3.h, 2.w, 3.h),
        children: [
          _buildPostCard(
            context,
            day: 'Monday',
            time: '9:00 AM',
            status: PostStatus.posted,
            content:
                "Ever wondered how our Pasta of the Day is made? Take a peek behind the scenes and see our talented chefs in action! Today's special: Penne Arrabbiata. Buon Appetito! 🍝🔥\n#PastaPassion #ChefSkills",
            image: 'assets/images/pasta.jpg',
            date: '01/02/2024',
          ),
          _buildPostCard(
            context,
            day: 'Tuesday',
            time: '9:00 AM',
            status: PostStatus.scheduled,
            content:
                "Ever wondered how our Pasta of the Day is made? Take a peek behind the scenes and see our talented chefs in action! Today's special: Penne Arrabbiata. Buon Appetito! 🍝🔥\n#PastaPassion #ChefSkills",
            image: null,
            date: '02/02/2024',
          ),
          _buildPostCard(
            context,
            day: 'Wednesday',
            time: '9:00 AM',
            status: PostStatus.confirmation,
            content:
                "Wine down with us this Wednesday! Explore our selection of exquisite Italian wines, perfectly paired with your favorite Italian dishes. Salute! 🍷✨\n#WineWednesday #ItalianElegance",
            date: '03/02/2024',
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(
    BuildContext context, {
    required String day,
    required String time,
    required PostStatus status,
    required String content,
    required String date,
    String? image,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    Color statusColor;
    String statusText;
    switch (status) {
      case PostStatus.posted:
        statusColor = Colors.green;
        statusText = 'POSTED';
        break;
      case PostStatus.scheduled:
        statusColor = Colors.orange;
        statusText = 'SCHEDULED';
        break;
      case PostStatus.confirmation:
        statusColor = Colors.transparent;
        statusText = '';
        break;
      default:
        statusColor = Colors.transparent;
        statusText = '';
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Container(
              padding: EdgeInsets.all(3.w),
              margin: EdgeInsets.only(top: 2.h),
              decoration: BoxDecoration(
                color: AppTheme.surfaceContainerHighest(context),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.h),
                  Text(
                    content,
                    style: GoogleFonts.roboto(
                      color: colorScheme.onSurface,
                      fontSize: 16.sp,
                    ),
                  ),
                  if (image != null)
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Image.asset(image),
                    )
                  else
                    Container(
                      height: 12.h,
                      margin: EdgeInsets.only(top: 2.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme.outline),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              UIcons.regularRounded.add,
                              size: 10.w,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'NO IMAGE',
                              style: GoogleFonts.roboto(
                                color: colorScheme.onSurface,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: _buildStatusButtons(status, colorScheme),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 10.w,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    day,
                    style: GoogleFonts.roboto(
                      color: colorScheme.onPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
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
                SizedBox(width: 2.w),
                if (status != PostStatus.confirmation)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: statusColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      statusText,
                      style: GoogleFonts.roboto(
                        color: statusColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            left: -1.w, // Adjust this value to position the date correctly
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
      ),
    );
  }

  List<Widget> _buildStatusButtons(PostStatus status, ColorScheme colorScheme) {
    switch (status) {
      case PostStatus.posted:
        return [
          IconButton(
            icon:
                Icon(UIcons.regularRounded.trash, color: colorScheme.onSurface),
            onPressed: () {
              // Add delete functionality
            },
          ),
        ];
      case PostStatus.scheduled:
        return [
          IconButton(
            icon:
                Icon(UIcons.regularRounded.edit, color: colorScheme.onSurface),
            onPressed: () {
              // Add edit functionality
            },
          ),
          IconButton(
            icon:
                Icon(UIcons.regularRounded.trash, color: colorScheme.onSurface),
            onPressed: () {
              // Add delete functionality
            },
          ),
        ];
      case PostStatus.confirmation:
        return [
          IconButton(
            icon:
                Icon(UIcons.regularRounded.edit, color: colorScheme.onSurface),
            onPressed: () {
              // Add edit functionality
            },
          ),
          IconButton(
            icon: Icon(Ionicons.checkmark_circle_outline,
                size: 8.w, color: colorScheme.onSurface),
            onPressed: () {
              // Add confirm functionality
            },
          ),
        ];
      default:
        return [];
    }
  }
}

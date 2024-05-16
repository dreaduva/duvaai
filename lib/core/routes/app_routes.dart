// lib/core/routes/app_routes.dart
import 'package:get/get.dart';
import '../../views/auth/login_page.dart';
import '../../views/dashboard/dashboard_page.dart';


class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String facebookPost = '/facebookPost';
  static const String instagramPost = '/instagramPost';
  static const String googleReviews = '/googleReviews';

  static final pages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: dashboard, page: () => DashboardPage()),
    // GetPage(name: facebookPost, page: () => FacebookPostPage()),
    // GetPage(name: instagramPost, page: () => InstagramPostPage()),
    // GetPage(name: googleReviews, page: () => GoogleReviewsPage()),
  ];
}

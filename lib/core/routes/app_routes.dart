import 'package:duvaai/views/auth/email_login_page.dart';
import 'package:duvaai/views/automations/facebook/facebook_post_page.dart';
import 'package:duvaai/views/automations/google/google_reviews_page.dart';
import 'package:duvaai/views/automations/instagram/instagram_post_page.dart';
import 'package:duvaai/views/splash/splash_screen.dart';
import 'package:get/get.dart';
import '../../views/auth/login_page.dart';
import '../../views/dashboard/dashboard_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String emailLogin = '/emailLogin';
  static const String dashboard = '/dashboard';
  static const String facebookPost = '/facebookPost';
  static const String instagramPost = '/instagramPost';
  static const String googleReviews = '/googleReviews';

  static final pages = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(
        name: login, transition: Transition.native, page: () => LoginPage()),
    GetPage(name: emailLogin, page: () => EmailLoginPage()),
    GetPage(
        name: dashboard,
        transition: Transition.native,
        page: () => const DashboardPage()),
    GetPage(name: googleReviews, page: () => GoogleReviewPage()),
    GetPage(name: facebookPost, page: () => FacebookPostPage()),
    GetPage(name: instagramPost, page: () => InstagramPostPage()),
    // GetPage(name: googleReviews, page: () => GoogleReviewsPage()),
  ];
}
